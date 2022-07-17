import 'package:flutter/';
import 'package:trip_details_new_project/trips_details_database.dart';
import 'dart:convert';
import 'models/get_trip_list_details_model.dart';
import 'package:intl/intl.dart';
import 'tabs/trip_details_tab_view.dart';
import './network_class.dart';
import './network_of_past_tab.dart';
import 'package:trip_details_new_project/models/get_trip_details_model.dart';
import 'package:trip_details_new_project/tabs/upcoming_tab_view.dart';
import 'package:trip_details_new_project/tabs/past_tab_view.dart';

class NetworkOfTripDetails {
  String? url;
  int? trIpId1;
  int index = 0;

  NetworkOfTripDetails(this.url, this.trIpId1);
  Future<TripDetailsModel> fetch() async {
    final response = await post(Uri.parse(Uri.encodeFull(url ?? 'sorry')),
        headers: ({"Content-Type": "application/json"}),
        body: json.encode({
          "tripId": trIpId1.toString(),
          "token": "NGQ1MDNkOTktOGZmOS00YWVlLTg1MGItZTg1YTczMzE0OTk5"
        }));

    print('response of trip details fetching');
    if (response.statusCode == 200) {
      print('response of trip deatails' + response.body.toString());
      print(response.body);

      TripDetailsModel getdata =
          TripDetailsModel.fromJson(jsonDecode(response.body));
      print('true of issuccess' + getdata.isSuccess.toString());
      print('Idresults' + getdata.resultTripsDetails!.tripId.toString());

      return getdata;
    }
    throw Exception('loading');
  }
}
