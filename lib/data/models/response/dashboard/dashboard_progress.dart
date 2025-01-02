// To parse this JSON data, do
//
//     final dashboardProgress = dashboardProgressFromMap(jsonString);

import 'dart:convert';

DashboardProgress dashboardProgressFromMap(String str) =>
    DashboardProgress.fromMap(json.decode(str));

String dashboardProgressToMap(DashboardProgress data) =>
    json.encode(data.toMap());

class DashboardProgress {
  final int statusCode;
  final List<Result> result;

  DashboardProgress({
    required this.statusCode,
    required this.result,
  });

  factory DashboardProgress.fromMap(Map<String, dynamic> json) =>
      DashboardProgress(
        statusCode: json["statusCode"],
        result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "statusCode": statusCode,
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
      };
}

class Result {
  final String statusNo;
  final String statusName;
  final int countData;

  Result({
    required this.statusNo,
    required this.statusName,
    required this.countData,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        statusNo: json["statusNo"],
        statusName: json["statusName"],
        countData: json["countData"],
      );

  Map<String, dynamic> toMap() => {
        "statusNo": statusNo,
        "statusName": statusName,
        "countData": countData,
      };

  @override
  String toString() {
    return 'Result(statusName: $statusName, countData: $countData)';
  }
}
