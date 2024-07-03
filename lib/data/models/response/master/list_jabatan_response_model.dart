import 'dart:convert';

ListJabatan listJabatanFromMap(String str) =>
    ListJabatan.fromMap(json.decode(str));

String listJabatanToMap(ListJabatan data) => json.encode(data.toMap());

class ListJabatan {
  final int statusCode;
  final List<Datum> data;
  final int countData;
  final int page;
  final int skip;
  final int countPage;

  ListJabatan({
    required this.statusCode,
    required this.data,
    required this.countData,
    required this.page,
    required this.skip,
    required this.countPage,
  });

  factory ListJabatan.fromMap(Map<String, dynamic> json) => ListJabatan(
        statusCode: json["statusCode"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
        countData: json["countData"] ?? 0,
        page: json["page"] ?? 0,
        skip: json["skip"] ?? 0,
        countPage: json["countPage"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "statusCode": statusCode,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "countData": countData,
        "page": page,
        "skip": skip,
        "countPage": countPage,
      };
}

class Datum {
  final String jabatanId;
  final String jabatanFullName;
  final String jabatanName;

  Datum({
    required this.jabatanId,
    required this.jabatanFullName,
    required this.jabatanName,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        jabatanId: json["jabatanID"],
        jabatanFullName: json["jabatanFullName"],
        jabatanName: json["jabatanName"],
      );

  Map<String, dynamic> toMap() => {
        "jabatanID": jabatanId,
        "jabatanFullName": jabatanFullName,
        "jabatanName": jabatanName,
      };

  @override
  String toString() {
    return 'Datum{jabatanId: $jabatanId, jabatanFullName: $jabatanFullName, jabatanName: $jabatanName}';
  }
}
