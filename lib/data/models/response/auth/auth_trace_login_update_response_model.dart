import 'dart:convert';

// Fungsi untuk mengkonversi dari JSON string ke model
UpdateTraceLoginModel updateTraceLoginModelFromJson(String str) =>
    UpdateTraceLoginModel.fromJson(json.decode(str));

// Fungsi untuk mengkonversi dari model ke JSON string
String updateTraceLoginModelToJson(UpdateTraceLoginModel data) =>
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

  // Factory method untuk membuat instance dari JSON map
  factory UpdateTraceLoginModel.fromJson(Map<String, dynamic> json) =>
      UpdateTraceLoginModel(
        statusCode: json["statusCode"],
        message: json["message"],
        result: Result.fromJson(json["result"]),
      );

  // Mengkonversi instance ke JSON map
  Map<String, dynamic> toMap() => {
        "statusCode": statusCode,
        "message": message,
        "result": result.toMap(),
      };
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

  // Factory method untuk membuat instance dari JSON map
  factory Result.fromJson(Map<String, dynamic> json) => Result(
        userId: json["userID"],
        namaDevice: json["namaDevice"],
        physicalDevice: json["physicalDevice"],
        serialNumber: json["serialNumber"],
        startLogin: DateTime.parse(json["startLogin"]),
        lastLogin: DateTime.parse(json["lastLogin"]),
      );

  // Mengkonversi instance ke JSON map
  Map<String, dynamic> toMap() => {
        "userID": userId,
        "namaDevice": namaDevice,
        "physicalDevice": physicalDevice,
        "serialNumber": serialNumber,
        "startLogin": startLogin.toIso8601String(),
        "lastLogin": lastLogin.toIso8601String(),
      };
}
