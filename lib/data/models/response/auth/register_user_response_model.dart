import 'dart:convert';

class RegisteruserModel {
  final int? statusCode;
  final String? message;
  final Result? result;

  RegisteruserModel({this.statusCode, this.message, this.result});

  factory RegisteruserModel.fromJson(Map<String, dynamic> json) =>
      RegisteruserModel.fromMap(json);

  String toJson() => json.encode(toMap());

  factory RegisteruserModel.fromMap(Map<String, dynamic> json) =>
      RegisteruserModel(
        statusCode: json["statusCode"],
        message: json["message"],
        result: json["result"] == null ? null : Result.fromMap(json["result"]),
      );

  Map<String, dynamic> toMap() => {
        "statusCode": statusCode,
        "message": message,
        "result": result?.toMap(),
      };
}

class Result {
  final String userId;
  final String password;

  Result({
    required this.userId,
    required this.password,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        userId: json["userID"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "userID": userId,
        "password": password,
      };
}
