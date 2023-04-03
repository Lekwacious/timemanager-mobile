class AuthErrorMessage {
  List<String>? password;
  List<String>? email;

  AuthErrorMessage({ this.password,  this.email});

  AuthErrorMessage.fromJson(Map<String, dynamic> json) {
    password =
    List<String>.from((json['password'] ?? [""]).map((e) => e.toString()));
    email = List<String>.from((json['email'] ?? [""]).map((e) => e.toString()));
  }
}