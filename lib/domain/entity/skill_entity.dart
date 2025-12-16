class SkillEntity {
  final int id;
  final int userResumeId;
  int displayOrder;
  String name;
  String description;

  SkillEntity({
    required this.id,
    required this.userResumeId,
    required this.displayOrder,
    required this.name,
    required this.description,
  });
}