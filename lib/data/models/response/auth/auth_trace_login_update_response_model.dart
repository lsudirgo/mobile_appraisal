import 'dart:convert';

UpdateTraceLoginModel updateTraceLoginModelFromMap(String str) =>
    UpdateTraceLoginModel.fromMap(json.decode(str));

String updateTraceLoginModelToMap(UpdateTraceLoginModel data) =>
    json.encode(data.toMap());

class UpdateTraceLoginModel {
  final int statusCode;
  final String message;
  final Result result;

  UpdateTraceLoginModel({
    required this.statusCode,
    required this.message,
    required this.result,
  });

  factory UpdateTraceLoginModel.fromMap(Map<String, dynamic> json) =>
      UpdateTraceLoginModel(
        statusCode: json["statusCode"],
        message: json["message"],
        result: Result.fromMap(json["result"]),
      );

  Map<String, dynamic> toMap() => {
        "statusCode": statusCode,
        "message": message,
        "result": result.toMap(),
      };

  static fromJson(String body) {}
}

class Result {
  final String userId;
  final String namaDevice;
  final String physicalDevice;
  final String serialNumber;
  final DateTime startLogin;
  final DateTime lastLogin;

  Result({
    required this.userId,
    required this.namaDevice,
    required this.physicalDevice,
    required this.serialNumber,
    required this.startLogin,
    required this.lastLogin,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        userId: json["userID"],
        namaDevice: json["namaDevice"],
        physicalDevice: json["physicalDevice"],
        serialNumber: json["serialNumber"],
        startLogin: DateTime.parse(json["startLogin"]),
        lastLogin: DateTime.parse(json["lastLogin"]),
      );

  Map<String, dynamic> toMap() => {
        "userID": userId,
        "namaDevice": namaDevice,
        "physicalDevice": physicalDevice,
        "serialNumber": serialNumber,
        "startLogin": startLogin.toIso8601String(),
        "lastLogin": lastLogin.toIso8601String(),
      };
}
