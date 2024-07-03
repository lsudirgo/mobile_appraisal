import 'dart:convert';

class AuthLoginModel {
  final int? statusCode;
  final Result? result;

  AuthLoginModel({
    required this.statusCode,
    required this.result,
  });

  factory AuthLoginModel.fromJson(Map<String, dynamic> json) =>
      AuthLoginModel.fromMap(json);

  String toJson() => json.encode(toMap());

  factory AuthLoginModel.fromMap(Map<String, dynamic> json) => AuthLoginModel(
        statusCode: json["statusCode"],
        result: json["result"] == null ? null : Result.fromMap(json["result"]),
      );

  Map<String, dynamic> toMap() => {
        "statusCode": statusCode,
        "result": result?.toMap(),
      };
}

class Result {
  final String userId;
  final String accessToken;
  final String refreshToken;
  final int expiresIn;
  final DateTime expiresAt;
  final int refreshexpiresIn;
  final DateTime refreshexpiresAt;
  final DetailData? detailData;
  final TraceLogin? traceLogin;

  Result({
    required this.userId,
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
    required this.expiresAt,
    required this.refreshexpiresIn,
    required this.refreshexpiresAt,
    required this.detailData,
    required this.traceLogin,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        userId: json["userID"] ?? '',
        accessToken: json["accessToken"] ?? '',
        refreshToken: json["refreshToken"] ?? '',
        expiresIn: json["expiresIn"] ?? 0,
        expiresAt: DateTime.parse(
            json["expiresAt"] ?? DateTime.now().toIso8601String()),
        refreshexpiresIn: json["refreshexpiresIn"] ?? 0,
        refreshexpiresAt: DateTime.parse(
            json["refreshexpiresAt"] ?? DateTime.now().toIso8601String()),
        detailData: json["detailData"] != null
            ? DetailData.fromMap(json["detailData"])
            : null,
        traceLogin: json["traceLogin"] != null
            ? TraceLogin.fromMap(json["traceLogin"])
            : null,
      );

  Map<String, dynamic> toMap() => {
        "userID": userId,
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "expiresIn": expiresIn,
        "expiresAt": expiresAt.toIso8601String(),
        "refreshexpiresIn": refreshexpiresIn,
        "refreshexpiresAt": refreshexpiresAt.toIso8601String(),
        "detailData": detailData?.toMap(),
        "traceLogin": traceLogin?.toMap(),
      };
}

class DetailData {
  final String name;
  final String level;
  final String otorisator;
  final String unitkerja;
  final String bagiansingkat;
  final String bagian;
  final String nip;
  final String jabatan;
  final String fou;
  final String gender;
  final String userid;

  DetailData({
    required this.name,
    required this.level,
    required this.otorisator,
    required this.unitkerja,
    required this.bagiansingkat,
    required this.bagian,
    required this.nip,
    required this.jabatan,
    required this.fou,
    required this.gender,
    required this.userid,
  });

  factory DetailData.fromMap(Map<String, dynamic> json) => DetailData(
        name: json["name"],
        level: json["level"] ?? '',
        otorisator: json["otorisator"],
        unitkerja: json["unitkerja"],
        bagiansingkat: json["bagiansingkat"],
        bagian: json["bagian"],
        nip: json["nip"],
        jabatan: json["jabatan"],
        fou: json["fou"],
        gender: json["gender"] ?? '',
        userid: json["userid"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "level": level,
        "otorisator": otorisator,
        "unitkerja": unitkerja,
        "bagiansingkat": bagiansingkat,
        "bagian": bagian,
        "nip": nip,
        "jabatan": jabatan,
        "fou": fou,
        "gender": gender,
        "userid": userid,
      };
}

class TraceLogin {
  final String nameDevice;
  final String physicalDevice;
  final String serialNumber;
  final DateTime atLogin;
  final DateTime lastLogin;

  TraceLogin({
    required this.nameDevice,
    required this.physicalDevice,
    required this.serialNumber,
    required this.atLogin,
    required this.lastLogin,
  });

  factory TraceLogin.fromMap(Map<String, dynamic> json) => TraceLogin(
        nameDevice: json["nameDevice"],
        physicalDevice: json["physicalDevice"],
        serialNumber: json["serialNumber"],
        atLogin: DateTime.parse(json["atLogin"]),
        lastLogin: DateTime.parse(json["lastLogin"]),
      );

  Map<String, dynamic> toMap() => {
        "nameDevice": nameDevice,
        "physicalDevice": physicalDevice,
        "serialNumber": serialNumber,
        "atLogin": atLogin.toIso8601String(),
        "lastLogin": lastLogin.toIso8601String(),
      };
}
