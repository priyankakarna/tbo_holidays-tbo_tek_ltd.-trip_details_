import 'dart:convert';
import 'package:trip_details_new_project/tabs/upcoming_tab_view.dart';
import 'package:http/http.dart';
import 'package:trip_details_new_project/tabs/upcoming_tab_view.dart';
import './trips_details_database.dart';
import 'models/get_trip_details_model.dart';
import './main.dart';
import 'package:trip_details_new_project/models/get_trip_details_model.dart';

class NetworkofUpcoming {
  String? url;
  String? token;

  NetworkofUpcoming(this.url, this.token);

  Future<TripViewModel> fetch() async {
    final response = await post(Uri.parse(Uri.encodeFull(url ?? 'sorry')),
        headers: ({"Content-Type": "application/json"}),
        body: jsonEncode({
          "UserId": 32464,
          "token": "MWIyMTVjYjctODQxNC00MjM1LTllNDctYjJmMjQ2NjA2NGQw",
          "TripViewType": "Upcoming",
          "TripPerPage": 50.toString(),
          "TripStartIndex": 0.toString(),
          "bookingType": (-1).toString()
        }));

    print('response');

    print(response.body.runtimeType);
    if (response.statusCode == 200) {
      print('response' + response.body);
      print('Type of response' + response.body.runtimeType.toString());

      TripViewModel tripViewModel =
          TripViewModel.fromJson(json.decode(response.body));
      print(response.body.length);

      final insertedData =
          await TripsdetailsDatabase.instance.insertTrip(tripViewModel);
      print(insertedData.toString() + 'data in databse');

      print(tripViewModel.tripsResult!.first.tripid);
      print(tripViewModel.tripsResult!.last.serviceTypeList!.length);

      print(tripViewModel);
      print(tripViewModel.isSuccess);
      print(tripViewModel.alerts);

      return tripViewModel;
    }

    throw Exception('loading');
  }
}
