import 'dart:convert';
import './network_class.dart';

import 'package:trip_details_new_project/tabs/upcoming_tab_view.dart';
import 'package:http/http.dart';
import 'package:trip_details_new_project/tabs/past_tab_view.dart';
import './trips_details_database.dart';
import 'models/get_trip_details_model.dart';
import './main.dart';

class NetworkofPast {
  String? url;
  String? token;

  NetworkofPast(this.url, this.token);

  Future<TripViewModel> fetch() async {
    final response = await post(Uri.parse(Uri.encodeFull(url ?? 'sorry')),
        headers: ({"Content-Type": "application/json"}),
        body: jsonEncode({
          "UserId": 32464,
          "Token": "MWIyMTVjYjctODQxNC00MjM1LTllNDctYjJmMjQ2NjA2NGQw",
          "TripViewType": "Past",
          "TripPerPage": 50.toString(),
          "TripStartIndex": 0.toString(),
          "bookingType": (-1).toString()
        }));
    print(response);
    print(response.body);
    print('response');

    print(response.body.runtimeType);
    if (response.statusCode == 200) {
      print('past ' + response.body);

      TripViewModel tripViewModel =
          TripViewModel.fromJson(json.decode(response.body));
      print('past trips' + response.body.length.toString());
      print(tripViewModel.runtimeType);
      print(tripViewModel.isSuccess);
      print(tripViewModel.tripsResult.runtimeType);
      final insertedData =
          await TripsdetailsDatabase.instance.insertTrip(tripViewModel);

      print(tripViewModel.tripsResult?.length);
      print(tripViewModel.tripsResult?.first.tripName);

      print(tripViewModel.alerts);
      return tripViewModel;

      var x = [1, 2, 3, 4];
      var y = List.from(x);
    }

    throw Exception('loading');
  }
}
