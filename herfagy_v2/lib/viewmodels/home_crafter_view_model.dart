import 'package:flutter/material.dart';

import '../models/categoty_model.dart';
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
      customerName: "أحمد علي",
      service: "نجارة",
      date: "2025-09-09",
      details: "تركيب مطبخ كامل من الخشب الطبيعي مع بعض التعديلات.",
    ),
    RequestModel(
      customerName: "سارة محمد",
      service: "كهرباء",
      date: "2025-09-10",
      details: "صيانة أسلاك كهرباء + تركيب 5 لمبات LED.",
    ),
    RequestModel(
      customerName: "سارة محمد",
      service: "كهرباء",
      date: "2025-09-10",
      details: "صيانة أسلاك كهرباء + تركيب 5 لمبات LED.",
    ),
    RequestModel(
      customerName: "سارة محمد",
      service: "كهرباء",
      date: "2025-09-10",
      details: "صيانة أسلاك كهرباء + تركيب 5 لمبات LED.",
    ),
    RequestModel(
      customerName: "سارة محمد",
      service: "كهرباء",
      date: "2025-09-10",
      details: "صيانة أسلاك كهرباء + تركيب 5 لمبات LED.",
    ),
    RequestModel(
      customerName: "سارة محمد",
      service: "كهرباء",
      date: "2025-09-10",
      details: "صيانة أسلاك كهرباء + تركيب 5 لمبات LED.",
    ),
  ];

  List<RequestModel> get requests => _requests;

  void addNewRequest(RequestModel newRequest) {
    _requests.insert(0, newRequest);
    notifyListeners();
  }

  void acceptRequest(int index) {
    _requests[index].isAccepted = true;
    notifyListeners();
  }

  void rejectRequest(int index) {
    _requests.removeAt(index);
    notifyListeners();
  }
}
