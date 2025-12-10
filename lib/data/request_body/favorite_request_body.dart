class FavoriteRequestBody {
  final int id;
  final int userResumeId;
  final int displayOrder;
  final String name;

  FavoriteRequestBody({
    required this.id,
    required this.userResumeId,
    required this.displayOrder,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userResumeId': userResumeId,
      'displayOrder': displayOrder,
      'name': name,
    };
  }
}
