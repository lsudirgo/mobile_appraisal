import 'dart:convert';

TraceLoginModel traceLoginModelFromMap(String str) =>
    TraceLoginModel.fromMap(json.decode(str));

String traceLoginModelToMap(TraceLoginModel data) => json.encode(data.toMap());

class TraceLoginModel {
  final int? statusCode;
  final String? message;
  final Result? result;

  TraceLoginModel({
    this.statusCode,
    this.message,
    this.result,
  });

  factory TraceLoginModel.fromMap(Map<String, dynamic> json) => TraceLoginModel(
        statusCode: json["statusCode"],
        message: json["message"],
        result: json["result"] == null ? null : Result.fromMap(json["result"]),
      );

  Map<String, dynamic> toMap() => {
        "statusCode": statusCode,
        "message": message,
        "result": result?.toMap(),
      };

  static fromJson(String body) {}
}

class Result {
  final String? userId;
  final String? namaDevice;
  final String? physicalDevice;
  final String? serialNumber;

  Result({
    this.userId,
    this.namaDevice,
    this.physicalDevice,
    this.serialNumber,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        userId: json["userID"],
        namaDevice: json["namaDevice"],
        physicalDevice: json["physicalDevice"],
        serialNumber: json["serialNumber"],
      );

  Map<String, dynamic> toMap() => {
        "userID": userId,
        "namaDevice": namaDevice,
        "physicalDevice": physicalDevice,
        "serialNumber": serialNumber,
      };
}
