import 'dart:io';
import 'package:flutter/material.dart';
import 'package:herfagy_v2/models/profile.dart';
import 'package:herfagy_v2/utils/localization_extension.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/profile_operation_view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import '../../../crafter/profile_for_crafter/widgets/photo_viewer.dart';
import 'avatar_widget.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({
    super.key,
    required this.userName,
    required this.location,
    required this.screenWidth,
  });

  final String userName;
  final String location;
  final double screenWidth;

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  File? profileImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final profileOperationViewModel = Provider.of<ProfileOperationViewModel>(
      context,
      listen: false,
    );

    Profile? profile = await profileOperationViewModel.getCurrentUserProfile();

    if (profile != null &&
        profile.imageUrl != null &&
        profile.imageUrl!.isNotEmpty) {
      final file = File(profile.imageUrl!);
      if (await file.exists()) {
        setState(() {
          profileImage = file;
        });
      }
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final profileOperationViewModel = Provider.of<ProfileOperationViewModel>(
      context,
      listen: false,
    );

    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      Profile? profile = await profileOperationViewModel
          .getCurrentUserProfile();

      final appDir = await getApplicationDocumentsDirectory();

      final avatarDir = Directory('${appDir.path}/avatarurl');
      if (!await avatarDir.exists()) {
        await avatarDir.create(recursive: true);
      }

      final fileName = path.basename(pickedFile.path);
      final savedImage = await File(
        pickedFile.path,
      ).copy('${avatarDir.path}/$fileName');

      if (!mounted) return;

      setState(() {
        profileImage = savedImage;

        if (profile != null) {
          Profile newProfile = Profile(
            id: profile.id,
            username: profile.username,
            email: profile.email,
            role: profile.role ?? "User",
            imageUrl: savedImage.path,
            location: profile.location ?? "",
          );

          profileOperationViewModel.updateProfile(newProfile);
        }
      });
    }

    if (mounted) Navigator.pop(context);
  }

  void _showImageSourceSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        final localization = context.localization;
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: Text(localization.takePhoto),
                onTap: () => _pickImage(ImageSource.camera),
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text(localization.chooseFromGallery),
                onTap: () => _pickImage(ImageSource.gallery),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (profileImage == null) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(context.localization.noPhotosYet)),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotoViewer(imageFile: profileImage!),
                ),
              );
            }
          },
          child: AvatarWidget(
            screenWidth: widget.screenWidth,
            profileImage: profileImage,
            onTap: _showImageSourceSheet,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          widget.userName,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on, color: Colors.grey[600], size: 25),
            const SizedBox(width: 5),
            Text(
              widget.location,
              style: TextStyle(color: Colors.grey[600], fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }
}
