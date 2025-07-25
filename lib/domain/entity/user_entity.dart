class UserEntity {
  final String id;
  final String keycloakId;
  final String fullName;
  final String email;
  final String username;
  final String avatar;

  UserEntity({
    required this.id,
    required this.keycloakId,
    required this.fullName,
    required this.email,
    required this.username,
    required this.avatar,
  });
}
