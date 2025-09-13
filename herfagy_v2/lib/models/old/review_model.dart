class ReviewModel {
  final String userName;
  final String userImageUrl;
  final double rating;
  final String date;
  final String comment;

  const ReviewModel({
    required this.userName,
    required this.userImageUrl,
    required this.rating,
    required this.date,
    required this.comment,
  });
}
