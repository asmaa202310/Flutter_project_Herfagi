import '/utils/get_localize_title.dart';

class RequestModel {
  final String customerName;
  final ServiceKey serviceKey;
  final String date;
  final String details;
  bool isAccepted;

  RequestModel({
    required this.customerName,
    required this.serviceKey,
    required this.date,
    required this.details,
    this.isAccepted = false,
  });
}
