import 'package:career_coach/domain/entity/user_resume_layout_entity.dart';

class UserResumeLayoutRequestBody {
  final int id;
  final String side;
  final List<String> sections;
  final double widthPercentage;

  UserResumeLayoutRequestBody({
    required this.id,
    required this.side,
    required this.sections,
    required this.widthPercentage,
  });

  Map<String, dynamic> toJson() {
    return {'id': id, 'side': side, 'sections': sections, 'widthPercentage': widthPercentage};
  }

  factory UserResumeLayoutRequestBody.fromEntity(UserResumeLayoutEntity entity) {
    return UserResumeLayoutRequestBody(
      id: entity.id,
      side: entity.side.name,
      sections: entity.sections.map( (e) => e.name).toList(),
      widthPercentage: entity.widthPercentage,
    );
  }
}
