import 'package:career_coach/domain/entity/user_resume_layout_entity.dart';
import 'package:career_coach/domain/enum/type_side_enum.dart';

class UserResumeLayoutRequestBody {
  final int id;
  TypeSideEnum side;
  List<String> sections;
  double widthPercentage;

  UserResumeLayoutRequestBody({
    required this.id,
    required this.side,
    required this.sections,
    required this.widthPercentage,
  });

  Map<String, dynamic> toJson() {
    return {'id': id, 'side': side.name, 'sections': sections, 'widthPercentage': widthPercentage};
  }

  factory UserResumeLayoutRequestBody.fromEntity(UserResumeLayoutEntity entity) {
    return UserResumeLayoutRequestBody(
      id: entity.id,
      side: entity.side,
      sections: entity.sections.map( (e) => e.name).toList(),
      widthPercentage: entity.widthPercentage,
    );
  }
}
