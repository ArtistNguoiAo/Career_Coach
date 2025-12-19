class AvatarEntity {
  final int id;
  final int userResumeId;
  String alt;
  String filename;
  String url;

  AvatarEntity({
    required this.id,
    required this.userResumeId,
    required this.alt,
    required this.filename,
    required this.url,
  });
}