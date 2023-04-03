// To parse this JSON data, do
//
//     final activityList = activityListFromJson(jsonString);

import 'dart:convert';

ActivityList activityListFromJson(String str) => ActivityList.fromJson(json.decode(str));

String activityListToJson(ActivityList data) => json.encode(data.toJson());

class ActivityList {
  ActivityList({
    required this.message,
    required this.responseCode,
    required this.timeStamp,
    required this.response,
    required this.successful,
  });

  String message;
  int responseCode;
  DateTime timeStamp;
  List<Response> response;
  bool successful;

  factory ActivityList.fromJson(Map<String, dynamic> json) => ActivityList(
    message: json["message"],
    responseCode: json["responseCode"],
    timeStamp: DateTime.parse(json["timeStamp"]),
    response: List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
    successful: json["successful"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "responseCode": responseCode,
    "timeStamp": "${timeStamp.year.toString().padLeft(4, '0')}-${timeStamp.month.toString().padLeft(2, '0')}-${timeStamp.day.toString().padLeft(2, '0')}",
    "response": List<dynamic>.from(response.map((x) => x.toJson())),
    "successful": successful,
  };
}

class Response {
  Response({
    required this.userId,
    required this.idNumber,
    this.title,
    this.description,
    required this.date,
    required this.timeStarted,
    this.timeEnded,
    required this.id,
  });

  int userId;
  String idNumber;
  dynamic title;
  dynamic description;
  String date;
  String timeStarted;
  dynamic timeEnded;
  int id;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    userId: json["userId"],
    idNumber: json["idNumber"],
    title: json["title"],
    description: json["description"],
    date: json["date"],
    timeStarted: json["timeStarted"],
    timeEnded: json["timeEnded"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "idNumber": idNumber,
    "title": title,
    "description": description,
    "date": date,
    "timeStarted": timeStarted,
    "timeEnded": timeEnded,
    "id": id,
  };
}
