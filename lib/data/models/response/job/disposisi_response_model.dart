import 'dart:convert';

Disposisi disposisiFromMap(String str) => Disposisi.fromMap(json.decode(str));

String disposisiToMap(Disposisi data) => json.encode(data.toMap());

class Disposisi {
  final int statusCode;
  final String message;
  final Result result;

  Disposisi({
    required this.statusCode,
    required this.message,
    required this.result,
  });

  factory Disposisi.fromMap(Map<String, dynamic> json) => Disposisi(
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
  final String appraisalId;
  final String namaNasabah;
  final String namaOndesk;
  final String namaOts;

  Result({
    required this.appraisalId,
    required this.namaNasabah,
    required this.namaOndesk,
    required this.namaOts,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        appraisalId: json["appraisalID"],
        namaNasabah: json["namaNasabah"],
        namaOndesk: json["namaOndesk"],
        namaOts: json["namaOts"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "appraisalID": appraisalId,
        "namaNasabah": namaNasabah,
        "namaOndesk": namaOndesk,
        "namaOts": namaOts,
      };
}
