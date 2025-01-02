// To parse this JSON data, do
//
//     final dashboardDone = dashboardDoneFromMap(jsonString);

import 'dart:convert';

DashboardDone dashboardDoneFromMap(String str) =>
    DashboardDone.fromMap(json.decode(str));

String dashboardDoneToMap(DashboardDone data) => json.encode(data.toMap());

class DashboardDone {
  final int statusCode;
  final List<Result> result;

  DashboardDone({
    required this.statusCode,
    required this.result,
  });

  factory DashboardDone.fromMap(Map<String, dynamic> json) => DashboardDone(
        statusCode: json["statusCode"],
        result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "statusCode": statusCode,
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
      };
}

class Result {
  final String statusName;
  final int? countData;

  Result({
    required this.statusName,
    required this.countData,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        statusName: json["statusName"],
        countData: json["countData"],
      );

  Map<String, dynamic> toMap() => {
        "statusName": statusName,
        "countData": countData,
      };

  @override
  String toString() {
    return 'Result(statusName: $statusName, countData: $countData)';
  }
}
