class UserEntity {
  final String id;
  final String keycloakId;
  final String fullName;
  final String email;
  final String phone;
  final String avatar;

  UserEntity({
    required this.id,
    required this.keycloakId,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.avatar,
  });
}
