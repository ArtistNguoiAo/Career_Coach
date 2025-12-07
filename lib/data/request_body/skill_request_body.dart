class SkillRequestBody {
  final int id;
  final int userResumeId;
  final int displayOrder;
  final String name;
  final String description;

  SkillRequestBody({
    required this.id,
    required this.userResumeId,
    required this.displayOrder,
    required this.name,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userResumeId': userResumeId,
      'displayOrder': displayOrder,
      'name': name,
      'description': description,
    };
  }
}