import 'dart:convert';

import '/trips_details_database.dart';
import 'package:trip_details_new_project/network_class.dart';
import 'package:trip_details_new_project/network_of_past_tab.dart';
import 'package:trip_details_new_project/main.dart';
import 'dart:math';

TripViewModel tripViewModelFromJson(String str) {
  return TripViewModel.fromJson(json.decode(str));
}

String tripViewModelToJson(TripViewModel data) => json.encode(data.toJson());

class TripViewModel {
  TripViewModel({
    this.tripsResult,
    this.isSuccess,
    this.errors,
    this.alerts,
  });

  List<Result>? tripsResult;
  bool? isSuccess;
  List<dynamic>? errors;
  List<dynamic>? alerts;

  factory TripViewModel.fromJson(Map<String, dynamic> json) => TripViewModel(
        tripsResult: json["Result"] == null
            ? null
            : List<Result>.from(json["Result"].map((x) => Result.fromJson(x))),
        isSuccess: json["IsSuccess"] == null ? null : json["IsSuccess"],
        errors: json["Errors"] == null
            ? null
            : List<dynamic>.from(json["Errors"].map((x) => x)),
        alerts: json["Alerts"] == null
            ? null
            : List<dynamic>.from(json["Alerts"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Result": tripsResult == null
            ? null
            : List<dynamic>.from(tripsResult!.map((x) => x.toJson())),
        "IsSuccess": isSuccess == null ? null : isSuccess,
        "Errors":
            errors == null ? null : List<dynamic>.from(errors!.map((x) => x)),
        "Alerts":
            alerts == null ? null : List<dynamic>.from(alerts!.map((x) => x)),
      };
}

String datajson(Result data) => json.encode(data.serviceTypeList.toString());

class Result {
  Result({
    this.tripName,
    this.startDate,
    this.endDate,
    this.tripOwnerName,
    this.tripStatus,
    this.tripid,
    this.serviceTypeList,
  });

  int? tripid;
  String? tripName;
  DateTime? startDate;
  DateTime? endDate;
  String? tripOwnerName;
  String? tripStatus;
  String? serviceTypeList;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        tripid: json['TripId'],
        tripName: json["TripName"] == null
            ? null
            //: tripNameValues.map[
            : json["TripName"],
        startDate: json["StartDate"] == null
            ? null
            : DateTime.parse(json["StartDate"]),
        endDate:
            json["EndDate"] == null ? null : DateTime.parse(json["EndDate"]),
        tripOwnerName:
            json["TripOwnerName"] == null ? null : json["TripOwnerName"],
        tripStatus: json["TripStatus"] == null ? null : json["TripStatus"],
        serviceTypeList: json["ServiceTypeList"] == null
            ? null
            : json['ServiceTypeList'].join(""),
      );

  Map<String, dynamic> toJson() => {
        "TripId": tripid == null ? null : tripid,
        "TripName": tripName == null ? null : tripName,
        "StartDate": startDate == null ? null : startDate!.toIso8601String(),
        "EndDate": endDate == null ? null : endDate!.toIso8601String(),
        "TripOwnerName": tripOwnerName == null ? null : tripOwnerName,
        "TripStatus": tripStatus == null ? null : tripStatus,
        "ServiceTypeList": serviceTypeList == null ? null : serviceTypeList,
      };
}
