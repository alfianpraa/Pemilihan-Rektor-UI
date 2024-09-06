class User {
  int id;
  String fullname;
  String email;
  String password;
  String phone;
  

  User(
    this.id,
    this.fullname,
    this.email,
    this.password,
    this.phone,
  );

  factory User.fromJson(Map<String, dynamic> json) => User(
        int.parse(json["id"]),
        json["fullname"],
        json["email"],
        json["password"],
        json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id.toString(),
        "fullname": fullname,
        "email": email,
        "password": password,
        "phone": phone,
      };
}
