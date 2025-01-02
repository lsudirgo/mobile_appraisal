// To parse this JSON data, do
//
//     final dashboardPending = dashboardPendingFromMap(jsonString);

import 'dart:convert';

DashboardPending dashboardPendingFromMap(String str) =>
    DashboardPending.fromMap(json.decode(str));

String dashboardPendingToMap(DashboardPending data) =>
    json.encode(data.toMap());

class DashboardPending {
  final int statusCode;
  final int result;

  DashboardPending({
    required this.statusCode,
    required this.result,
  });

  factory DashboardPending.fromMap(Map<String, dynamic> json) =>
      DashboardPending(
        statusCode: json["statusCode"],
        result: json["result"],
      );

  Map<String, dynamic> toMap() => {
        "statusCode": statusCode,
        "result": result,
      };
}
