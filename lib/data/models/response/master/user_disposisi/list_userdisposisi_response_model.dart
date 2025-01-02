import 'dart:convert';

ListUserDisposisi listUserDisposisiFromMap(String str) =>
    ListUserDisposisi.fromMap(json.decode(str));

String listUserDisposisiToMap(ListUserDisposisi data) =>
    json.encode(data.toMap());

class ListUserDisposisi {
  final int statusCode;
  final List<DatumListUserDisposisi> data;
  final int countData;
  final int page;
  final int skip;
  final int countPage;

  ListUserDisposisi({
    required this.statusCode,
    required this.data,
    required this.countData,
    required this.page,
    required this.skip,
    required this.countPage,
  });

  factory ListUserDisposisi.fromMap(Map<String, dynamic> json) =>
      ListUserDisposisi(
        statusCode: json["statusCode"],
        data: List<DatumListUserDisposisi>.from(
            json["data"].map((x) => DatumListUserDisposisi.fromMap(x))),
        countData: json["countData"],
        page: json["page"],
        skip: json["skip"],
        countPage: json["countPage"],
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

class DatumListUserDisposisi {
  final String userId;
  final String userFullName;
  final String userJabatan;
  final String userUnitKerjaId;
  final int countuserPendingDesk;
  final int countuserPendingOTS;

  DatumListUserDisposisi({
    required this.userId,
    required this.userFullName,
    required this.userJabatan,
    required this.userUnitKerjaId,
    required this.countuserPendingDesk,
    required this.countuserPendingOTS,
  });

  factory DatumListUserDisposisi.fromMap(Map<String, dynamic> json) =>
      DatumListUserDisposisi(
        userId: json["userID"],
        userFullName: json["userFullName"],
        userJabatan: json["userJabatan"]!,
        userUnitKerjaId: json["userUnitKerjaID"],
        countuserPendingDesk: json["countuserPendingDesk"],
        countuserPendingOTS: json["countuserPendingOTS"],
      );

  Map<String, dynamic> toMap() => {
        "userID": userId,
        "userFullName": userFullName,
        "userJabatan": userJabatan,
        "userUnitKerjaID": userUnitKerjaId,
        "countuserPendingDesk": countuserPendingDesk,
        "countuserPendingOTS": countuserPendingOTS,
      };
}
