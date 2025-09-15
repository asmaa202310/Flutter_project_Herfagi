import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CompleteInfoViewModel extends ChangeNotifier {
  String? _selectedService;
  File? _idCardImage;

  String? get selectedService => _selectedService;
  File? get idCardImage => _idCardImage;

  void setService(String? service) {
    _selectedService = service;
    notifyListeners();
  }

  Future<void> pickIdCardImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _idCardImage = File(pickedFile.path);
      notifyListeners();
    }
  }
}
