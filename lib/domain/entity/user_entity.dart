class UserEntity {
  final String avatar;
  final String phone;
  final String email;
  final String fullName;
  final List<String> roles;

  UserEntity({
    required this.avatar,
    required this.phone,
    required this.email,
    required this.fullName,
    required this.roles,
  });
}
