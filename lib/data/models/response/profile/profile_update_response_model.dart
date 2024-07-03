// To parse this JSON data, do
//
//     final updateProfile = updateProfileFromMap(jsonString);

import 'dart:convert';

UpdateProfile updateProfileFromMap(String str) =>
    UpdateProfile.fromMap(json.decode(str));

String updateProfileToMap(UpdateProfile data) => json.encode(data.toMap());

class UpdateProfile {
  final int statusCode;
  final String message;
  final Result result;

  UpdateProfile({
    required this.statusCode,
    required this.message,
    required this.result,
  });

  factory UpdateProfile.fromMap(Map<String, dynamic> json) => UpdateProfile(
        statusCode: json["statusCode"],
        message: json["message"],
        result: Result.fromMap(json["result"]),
      );

  Map<String, dynamic> toMap() => {
        "statusCode": statusCode,
        "message": message,
        "result": result.toMap(),
      };
}

class Result {
  final String jabatanId;
  final String? level;
  final String? bagian;
  final String? gender;

  Result({
    required this.jabatanId,
    required this.level,
    required this.bagian,
    required this.gender,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        jabatanId: json["jabatanID"],
        level: json["level"] ?? '',
        bagian: json["bagian"] ?? '',
        gender: json["gender"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "jabatanID": jabatanId,
        "level": level,
        "bagian": bagian,
        "gender": gender,
      };
}
