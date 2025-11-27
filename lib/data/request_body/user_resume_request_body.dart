import 'package:career_coach/data/request_body/user_resume_layout_request_body.dart';

class UserResumeRequestBody {
  final int id;
  String title;
  int numberOfColumns;
  String language;
  String fontFamily;
  int fontSize;
  double lineHeight;
  String color;
  List<UserResumeLayoutRequestBody> layouts;

  UserResumeRequestBody({
    required this.id,
    required this.title,
    required this.numberOfColumns,
    required this.language,
    required this.fontFamily,
    required this.fontSize,
    required this.lineHeight,
    required this.color,
    required this.layouts,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'numberOfColumns': numberOfColumns,
      'language': language,
      'fontFamily': fontFamily,
      'fontSize': fontSize,
      'lineHeight': lineHeight,
      'color': color,
      'layouts': layouts.map((layout) => layout.toJson()).toList(),
    };
  }
}
