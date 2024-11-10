class AppUser {
  final String id;
  final String name;
  final String email;
  final String password;
  final String phone;

  AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) => AppUser(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
      };
  AppUser copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? phone,
  }) =>
      AppUser(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        phone: phone ?? this.phone,
      );
}
