class RequestModel {
  final String customerName;
  final String serviceKey;
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