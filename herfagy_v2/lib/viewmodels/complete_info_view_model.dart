import 'dart:io';
import 'package:flutter/material.dart';
import 'package:herfagy_v2/models/service.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/profile_operation_view_model.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/service_operation_view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:herfagy_v2/services/setup.dart';

class CompleteInfoViewModel extends ChangeNotifier {
  int? _selectedServiceId;
  File? _idCardImage;
  final ImagePicker _picker = ImagePicker();
  final SupabaseClient supabaseClient = sl<SupabaseClient>();

  File? get idCardImage => _idCardImage;

  String? _selectedServiceName;

  String? get selectedServiceName => _selectedServiceName;
  int? get selectedServiceId => _selectedServiceId;

  Future<void> setService(String serviceName, BuildContext context) async {
    _selectedServiceName = serviceName; 

    final serviceTranslations = {
      "نجارة": "carpenter",
      "سباكة": "plumber",
      "كهرباء": "electrician",
      "حدادة": "blacksmith",
      "دهانات": "painter",
      "تكييف وتبريد": "airConditioning",
    };

    final dbServiceName = serviceTranslations[serviceName];
    if (dbServiceName == null) return;

    final result = await supabaseClient
        .from('services')
        .select('id, name')
        .eq('name', dbServiceName)
        .maybeSingle();

    if (result != null) {
      final selectedService = Service.fromMap(result);
      _selectedServiceId = selectedService.id;

      // update profile
      final profileVM = Provider.of<ProfileOperationViewModel>(
        context,
        listen: false,
      );
      final profile = await profileVM.getCurrentUserProfile();
      if (profile?.id != null) {
        await supabaseClient
            .from('profiles')
            .update({'service_id': _selectedServiceId})
            .eq('id', profile!.id);
      }
    }

    notifyListeners();
  }

  Future<void> pickIdCardImage(ImageSource source, BuildContext context) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      final appDir = await getApplicationDocumentsDirectory();
      final idDir = Directory('${appDir.path}/idCards');

      if (!await idDir.exists()) {
        await idDir.create(recursive: true);
      }

      final fileName = path.basename(pickedFile.path);
      final savedImage = await File(
        pickedFile.path,
      ).copy('${idDir.path}/$fileName');

      if (!context.mounted) return;

      _idCardImage = savedImage;
      notifyListeners();

      final prov = Provider.of<ProfileOperationViewModel>(
        context,
        listen: false,
      );
      final profile = await prov.getCurrentUserProfile();
      final userId = profile?.id;

      if (userId == null) {
        debugPrint("No user logged in");
        return;
      }

      final storagePath = 'id_cards/$userId/$fileName';

      try {
        await supabaseClient.storage
            .from('avatars')
            .upload(
              storagePath,
              savedImage,
              fileOptions: const FileOptions(
                cacheControl: '3600',
                upsert: true,
              ),
            );

        final publicUrl = supabaseClient.storage
            .from('avatars')
            .getPublicUrl(storagePath);

        await supabaseClient
            .from('profiles')
            .update({'imageUrl_id': publicUrl})
            .eq('id', userId);

        debugPrint(" Image uploaded and DB updated with URL: $publicUrl");
      } catch (e) {
        debugPrint(" Upload error: $e");
      }

      if (context.mounted) Navigator.pop(context);
    }
  }

  void showImageSourceSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Take Photo"),
                onTap: () => pickIdCardImage(ImageSource.camera, context),
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Choose from Gallery"),
                onTap: () => pickIdCardImage(ImageSource.gallery, context),
              ),
            ],
          ),
        );
      },
    );
  }
}
