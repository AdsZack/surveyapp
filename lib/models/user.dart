class User {
  final String email;
  final String password;

  User({required this.email, required this.password});

  // Konversi data dari bentuk Json
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      password: json['password'],
    );
  }

  // Konversi data ke bentu Json
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
