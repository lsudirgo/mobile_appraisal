import 'dart:convert';

class AuthUserResponseModel {
  final int? statusCode;
  final Result? result;

  AuthUserResponseModel({this.statusCode, this.result});

  factory AuthUserResponseModel.fromJson(Map<String, dynamic> json) =>
      AuthUserResponseModel.fromMap(json);

  String toJson() => json.encode(toMap());

  factory AuthUserResponseModel.fromMap(Map<String, dynamic> json) =>
      AuthUserResponseModel(
        statusCode: json["statusCode"],
        result: json["result"] == null ? null : Result.fromMap(json["result"]),
      );

  Map<String, dynamic> toMap() => {
        "statusCode": statusCode,
        "result": result?.toMap(),
      };
}

class Result {
  String userId;
  String nipUser;
  String namaUser;
  String levelOtorisator;
  String bagianUser;
  String unitkerjaUser;

  Result({
    required this.userId,
    required this.nipUser,
    required this.namaUser,
    required this.levelOtorisator,
    required this.bagianUser,
    required this.unitkerjaUser,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        userId: json["userID"],
        nipUser: json["nipUser"],
        namaUser: json["namaUser"],
        levelOtorisator: json["levelOtorisator"],
        bagianUser: json["bagianUser"],
        unitkerjaUser: json["unitkerjaUser"],
      );

  Map<String, dynamic> toMap() => {
        "userID": userId,
        "nipUser": nipUser,
        "namaUser": namaUser,
        "levelOtorisator": levelOtorisator,
        "bagianUser": bagianUser,
        "unitkerjaUser": unitkerjaUser,
      };
}
