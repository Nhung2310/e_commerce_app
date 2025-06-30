class Review {
  final String reviewerName;
  final String date;
  final int rating;
  final String reviewText;
  final String? avatarUrl;
  final List<String>? photoUrls;

  Review({
    required this.reviewerName,
    required this.date,
    required this.rating,
    required this.reviewText,
    this.avatarUrl,
    this.photoUrls,
  });
}
