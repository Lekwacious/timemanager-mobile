// To parse this JSON data, do
//
//     final activity = activityFromJson(jsonString);

import 'dart:convert';

Activity activityFromJson(String str) => Activity.fromJson(json.decode(str));

String activityToJson(Activity data) => json.encode(data.toJson());

class Activity {
  Activity({
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

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
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
    required this.userId,
    required this.idNumber,
    required this.title,
    required this.description,
    required this.date,
    required this.timeStarted,
    this.timeEnded,
    required this.id,
  });

  int userId;
  String idNumber;
  String title;
  String description;
  DateTime date;
  String timeStarted;
  dynamic timeEnded;
  int id;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    userId: json["userId"],
    idNumber: json["idNumber"],
    title: json["title"],
    description: json["description"],
    date: DateTime.parse(json["date"]),
    timeStarted: json["timeStarted"],
    timeEnded: json["timeEnded"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "idNumber": idNumber,
    "title": title,
    "description": description,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "timeStarted": timeStarted,
    "timeEnded": timeEnded,
    "id": id,
  };
}
