// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.message,
    required this.responseCode,
    required this.timeStamp,
    required this.response,
    required this.successful,
  });

  String message;
  int responseCode;
  DateTime timeStamp;
  Response response;
  bool successful;

  factory User.fromJson(Map<String, dynamic> json) => User(
    message: json["message"],
    responseCode: json["responseCode"],
    timeStamp: DateTime.parse(json["timeStamp"]),
    response: Response.fromJson(json["response"]),
    successful: json["successful"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "responseCode": responseCode,
    "timeStamp": "${timeStamp.year.toString().padLeft(4, '0')}-${timeStamp.month.toString().padLeft(2, '0')}-${timeStamp.day.toString().padLeft(2, '0')}",
    "response": response.toJson(),
    "successful": successful,
  };
}

class Response {
  Response({
    required this.id,
    this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    this.idNumber,
    required this.password,
    required this.roles,
  });

  int id;
  dynamic username;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  dynamic idNumber;
  String password;
  List<Role> roles;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    id: json["id"],
    username: json["username"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    idNumber: json["idNumber"],
    password: json["password"],
    roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phoneNumber": phoneNumber,
    "idNumber": idNumber,
    "password": password,
    "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
  };
}

class Role {
  Role({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
