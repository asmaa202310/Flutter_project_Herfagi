import 'package:flutter/material.dart';

import '../models/old/categoty_model.dart';
import '../models/request_model.dart';

class ProgressProvider extends ChangeNotifier {
  double _progress = 0.75;
  int _completedProjects = 15;
  int _uncompletedProjects = 5;

  double get progress => _progress;
  int get completedProjects => _completedProjects;
  int get uncompletedProjects => _uncompletedProjects;

  void updateProgress(double value) {
    _progress = value;
    notifyListeners();
  }

  void updateCompletedProjects(int value) {
    _completedProjects = value;
    notifyListeners();
  }

  void updateUncompletedProjects(int value) {
    _uncompletedProjects = value;
    notifyListeners();
  }
}

class CrafterServicesProvider extends ChangeNotifier {
  final List<CategoryModel> _services = [
    CategoryModel(title: "كهربائي", icon: Icons.flash_on, color: Colors.yellow),
    CategoryModel(title: "نجار", icon: Icons.handyman, color: Colors.orange),
    CategoryModel(title: "سباك", icon: Icons.water_damage, color: Colors.blue),
  ];

  List<CategoryModel> get services => List.unmodifiable(_services);

  void addService(CategoryModel service) {
    _services.add(service);
    notifyListeners();
  }

  void removeService(CategoryModel service) {
    _services.remove(service);
    notifyListeners();
  }

  void clearServices() {
    _services.clear();
    notifyListeners();
  }
}

class RequestsProvider extends ChangeNotifier {
  final List<RequestModel> _requests = [
    RequestModel(
      customerName: "فاطمة الزهراء",
      service: "سباكة",
      date: "2025-09-12",
      details: "يوجد تسريب مياه أسفل حوض المطبخ، يتطلب فحص وإصلاح فوري.",
    ),
    RequestModel(
      customerName: "خالد المصري",
      service: "دهان",
      date: "2025-09-11",
      details: "دهان جدران غرفة المعيشة بالكامل باللون الأبيض.",
    ),
    RequestModel(
      customerName: "مريم عبد الرحمن",
      service: "تكييف وتبريد",
      date: "2025-09-11",
      details: "صيانة دورية لوحدة التكييف وتنظيف الفلاتر قبل دخول الشتاء.",
    ),
    RequestModel(
      customerName: "يوسف حمدي",
      service: "كهرباء",
      date: "2025-09-10",
      details: "تركيب 3 نقاط كهرباء جديدة في الغرفة.",
    ),
    RequestModel(
      customerName: "طارق شوقي",
      service: "نجارة",
      date: "2025-09-10",
      details: "إصلاح باب شرفة مكسور لا يغلق بإحكام.",
    ),
  ];
  List<RequestModel> get requests => _requests;

  void addNewRequest(RequestModel newRequest) {
    _requests.add(newRequest);
    notifyListeners();
  }

  void acceptRequest(RequestModel newRequest) {
    newRequest.isAccepted = true;
    _requests.remove(newRequest);
    notifyListeners();
  }

  void rejectRequest(RequestModel newRequest) {
    _requests.remove(newRequest);
    notifyListeners();
  }
}
