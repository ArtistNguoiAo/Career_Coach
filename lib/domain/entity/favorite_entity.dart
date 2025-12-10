class FavoriteEntity {
  final int id;
  final int userResumeId;
  int displayOrder;
  String name;

  FavoriteEntity({
    required this.id,
    required this.userResumeId,
    required this.displayOrder,
    required this.name,
  });
}