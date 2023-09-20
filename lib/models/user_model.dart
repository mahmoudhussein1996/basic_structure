class User
{
  final int id;
  final String token;
  final String name;
  final String email;
  final String password;
  final String phone;
  final String dateOfBirth;
  final String country;

  User({
    required this.id,
    required this.name,
    required this.password, e,
    required this.token,
    required this.email,
    required this.phone,
    required this.dateOfBirth,
    required this.country,
   // required this.offset,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'] ?? "",
      token: json['token'] ?? "",
      email: json['email'] ?? "",
      dateOfBirth: json['birthdate'] ?? "",
      country: json['time_zone'] ?? "",
      password: json['password'] ?? "",
      phone: json['phone'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'name':name,
      'birthdate':dateOfBirth,
      'time_zone':country,
      'phone': phone,
      "token":token,
      "email":email,
      "password":password,
    };
  }


}