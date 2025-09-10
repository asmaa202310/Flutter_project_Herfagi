class RequestModel {
  final String customerName;
  final String service;
  final String date;
  final String details;
  bool isAccepted;

  RequestModel({
    required this.customerName,
    required this.service,
    required this.date,
    required this.details,
    this.isAccepted = false,
  });
}