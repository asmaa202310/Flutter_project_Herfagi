import 'package:flutter/material.dart';

class BookNowViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  DateTime? selectedDate;
  String? selectedService;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();

  void setService(String? service) {
    selectedService = service;
    notifyListeners();
  }

  void setDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  void dispose() {
    phoneController.dispose();
    addressController.dispose();
    detailsController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
