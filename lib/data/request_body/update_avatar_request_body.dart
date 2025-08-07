import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class UpdateAvatarRequestBody {
  final File avatar;

  UpdateAvatarRequestBody({required this.avatar});

  Map<String, dynamic> toJson() {
    return {'avatar': avatar};
  }

  FormData toFormData() {
    return FormData.fromMap({
      'avatar': MultipartFile.fromFileSync(
        avatar.path,
        contentType: MediaType('image', 'jpeg'),
      ),
    });
  }
}
