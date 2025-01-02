// To parse this JSON data, do
//
//     final jobList = jobListFromMap(jsonString);

import 'dart:convert';

JobListRespnseModel jobListFromMap(String str) =>
    JobListRespnseModel.fromMap(json.decode(str));

String jobListToMap(JobListRespnseModel data) => json.encode(data.toMap());

class JobListRespnseModel {
  final int statusCode;
  final List<Datum> data;
  final int? countData;
  final int? page;
  final int? skip;
  final int? countPage;

  JobListRespnseModel({
    required this.statusCode,
    required this.data,
    this.countData,
    this.page,
    this.skip,
    this.countPage,
  });

  factory JobListRespnseModel.fromMap(Map<String, dynamic> json) =>
      JobListRespnseModel(
        statusCode: json["statusCode"],
        data: json["data"] != null
            ? List<Datum>.from(json["data"].map((x) => Datum.fromMap(x)))
            : [],
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

class Datum {
  final String orderId;
  final DateTime orderDate;
  final String orderAmount;
  final String orderName;
  final String orderNo;
  final String orderSource;
  final String orderBranchId;
  final String orderBranchName;
  final String orderSegmen;
  final String orderType;
  final String orderStatus;
  final String orderotsId;
  final String orderOndeskId;
  final String orderNamaReviewer;
  final OrderjenisObjek orderjenisObjek;

  Datum({
    required this.orderId,
    required this.orderDate,
    required this.orderAmount,
    required this.orderName,
    required this.orderNo,
    required this.orderSource,
    required this.orderBranchId,
    required this.orderBranchName,
    required this.orderSegmen,
    required this.orderType,
    required this.orderStatus,
    required this.orderotsId,
    required this.orderOndeskId,
    required this.orderNamaReviewer,
    required this.orderjenisObjek,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        orderId: json["orderID"],
        orderDate: DateTime.parse(json["orderDate"]),
        orderAmount: json["orderAmount"],
        orderName: json["orderName"],
        orderNo: json["orderNo"],
        orderSource: json["orderSource"],
        orderBranchId: json["orderBranchID"],
        orderBranchName: json["orderBranchName"],
        orderSegmen: json["orderSegmen"],
        orderType: json["orderType"],
        orderStatus: json["orderStatus"],
        orderotsId: json["orderotsID"],
        orderOndeskId: json["orderOndeskID"],
        orderNamaReviewer: json["orderNamaReviewer"],
        orderjenisObjek: OrderjenisObjek.fromMap(json["orderjenisObjek"]),
      );

  Map<String, dynamic> toMap() => {
        "orderID": orderId,
        "orderDate": orderDate.toIso8601String(),
        "orderAmount": orderAmount,
        "orderName": orderName,
        "orderNo": orderNo,
        "orderSource": orderSource,
        "orderBranchID": orderBranchId,
        "orderBranchName": orderBranchName,
        "orderSegmen": orderSegmen,
        "orderType": orderType,
        "orderStatus": orderStatus,
        "orderotsID": orderotsId,
        "orderOndeskID": orderOndeskId,
        "orderNamaReviewer": orderNamaReviewer,
        "orderjenisObjek": orderjenisObjek.toMap(),
      };
}

class OrderjenisObjek {
  final dynamic detailId;
  final String detailName;
  final String? detailAlamat;
  final String? detaildesaId;
  final String? detaildesaName;
  final String? detailkecamatan;
  final String? detailkotaId;
  final String? detailkotaName;
  final String? detailProvinsi;
  final String? detailDeskripsi;
  final String? detailMerk;
  final String? detailType;

  OrderjenisObjek({
    required this.detailId,
    required this.detailName,
    this.detailAlamat,
    this.detaildesaId,
    this.detaildesaName,
    this.detailkecamatan,
    this.detailkotaId,
    this.detailkotaName,
    this.detailProvinsi,
    this.detailDeskripsi,
    this.detailMerk,
    this.detailType,
  });

  factory OrderjenisObjek.fromMap(Map<String, dynamic> json) => OrderjenisObjek(
        detailId: json["detailID"],
        detailName: json["detailName"],
        detailAlamat: json["detailAlamat"],
        detaildesaId: json["detaildesaID"],
        detaildesaName: json["detaildesaName"],
        detailkecamatan: json["detailkecamatan"],
        detailkotaId: json["detailkotaID"],
        detailkotaName: json["detailkotaName"],
        detailProvinsi: json["detailProvinsi"],
        detailDeskripsi: json["detailDeskripsi"],
        detailMerk: json["detailMerk"],
        detailType: json["detailType"],
      );

  Map<String, dynamic> toMap() => {
        "detailID": detailId,
        "detailName": detailName,
        "detailAlamat": detailAlamat,
        "detaildesaID": detaildesaId,
        "detaildesaName": detaildesaName,
        "detailkecamatan": detailkecamatan,
        "detailkotaID": detailkotaId,
        "detailkotaName": detailkotaName,
        "detailProvinsi": detailProvinsi,
        "detailDeskripsi": detailDeskripsi,
        "detailMerk": detailMerk,
        "detailType": detailType,
      };
}
