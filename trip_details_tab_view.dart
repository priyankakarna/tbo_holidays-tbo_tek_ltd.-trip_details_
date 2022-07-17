import 'package:intl/intl.dart';
import 'package:trip_details_new_project/models/get_trip_details_model.dart';
import 'package:trip_details_new_project/models/get_trip_list_details_model.dart';
import 'package:flutter/material.dart';
import 'package:trip_details_new_project/network_of_past_tab.dart';
import 'package:trip_details_new_project/network_tripDetails.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:trip_details_new_project/tabs/upcoming_tab_view.dart';
import 'package:trip_details_new_project/trips_details_database.dart';
import 'dart:ui' as ui;

class Tripdetails extends StatefulWidget {
  int tripId;

  Tripdetails({required this.tripId});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TripdetailsState();
  }
}

class TripdetailsState extends State<Tripdetails> {
  bool viewMore = true;
  bool isTapped = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.black,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 5),
              child: Icon(
                Icons.share,
                size: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.grey.shade200,
        body: FutureBuilder<TripDetailsModel>(
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Center(
                    child: Text(
                  'Sorry',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ));
              }

              print('snapshot of trip details');
              return TripsDetailsList(context, snapshot.data);
            }

            return Center(child: CircularProgressIndicator());
          },
          future: NetworkOfTripDetails(
                  'https://paxesapi-core.techmaster.in/api/Admin/Trip/GetTripDetails',
                  widget.tripId)
              .fetch(),
        ));
  }

  Widget TripsDetailsList(context, TripDetailsModel result) {
    List<String> passengersNamesList = [];
    int index = 0;
    String hotelRating = result.resultTripsDetails
            ?.hotelTripItineraryDetails?[0].itemItinerary?.hotelRating
            .toString() ??
        '';

    var s = result.resultTripsDetails?.hotelTripItineraryDetails;

    if (s != null) {
      for (int i = 0;
          i < result.resultTripsDetails!.hotelTripItineraryDetails!.length;
          i++) {
        for (int j = 0;
            j <
                result.resultTripsDetails!.hotelTripItineraryDetails![i]
                    .itemItinerary!.rooms!.length;
            j++) {
          for (int k = 0;
              k <
                  result.resultTripsDetails!.hotelTripItineraryDetails![i]
                      .itemItinerary!.rooms![j].passengers!.length;
              k++) {
            var paxName = result
                .resultTripsDetails!
                .hotelTripItineraryDetails![i]
                .itemItinerary!
                .rooms![j]
                .passengers![k]
                .fullName
                .toString();
            print('passengers list names' + paxName.toString());
            passengersNamesList.add(paxName);
          }
        }
      }

      return ListView(children: [
        Container(
          height:
              isTapped ? 39 : 50 + (39 * passengersNamesList.length).toDouble(),
          margin: EdgeInsets.only(top: 11, left: 7, right: 7),
          width: 390,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200, width: 1),
              color: Colors.white),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Flexible(
              flex: 190,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 9, top: 5),
                      child: Container(
                        height: 30,
                        width: 90,
                        child: Text('Traveller Info',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Flexible(
                      flex: 4,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 5, left: 49),
                          child: Container(
                            height: 30,
                            width: 90,
                            child: Text(
                                'Trip ID - ' +
                                    result.resultTripsDetails!.tripId
                                        .toString(),
                                style: const TextStyle(
                                    fontSize: 11,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          )),
                    ),
                    Flexible(
                      flex: 4,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 5,
                          top: 5,
                          right: 5,
                        ),
                        child: Container(
                          height: 20,
                          width: 70,
                          child: ElevatedButton.icon(
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                            onPressed: () {
                              setState(() {
                                isTapped = !isTapped;
                              });
                            },
                            icon: const Icon(Icons.keyboard_arrow_down,
                                size: 15, color: Colors.black),
                            label: Text(
                              isTapped ? 'no' : 'yes',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
            Visibility(
              visible: !isTapped,
              child: Container(
                height: (39 * passengersNamesList.length).toDouble(),
                width: 390,
                child: ListView.builder(
                    itemCount: passengersNamesList.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 23,
                        margin:
                            const EdgeInsets.only(top: 14, left: 10, right: 10),

                        //width: 220,
                        child: Directionality(
                          textDirection: ui.TextDirection.rtl,
                          child: TextField(
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                            readOnly: true,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                  fontSize: 19,
                                  background: Paint()..color = Colors.blue,
                                  color: Colors.white),
                              labelText: index == 0 ? ' Lead ' : null,
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                            ),
                            controller: TextEditingController(
                                text: passengersNamesList[index].toString()),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ]),
        ),
        Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 9, right: 9, left: 9),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade100, width: 2)),
            child: Row(
              children: [
                const Icon(Icons.hotel, size: 25, color: Colors.grey),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 5),
                  // ignore: unnecessary_null_comparison
                  child: Text(
                      result.resultTripsDetails?.hotelTripItineraryDetails?[0]
                                  .itemItinerary?.checkInDate
                                  .toString() ==
                              null
                          ? ''
                          : DateFormat('MMM dd,yyyy').format(DateTime.parse(
                              result
                                      .resultTripsDetails
                                      ?.hotelTripItineraryDetails?[0]
                                      .itemItinerary
                                      ?.checkInDate
                                      .toString() ??
                                  '')),
                      style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                const Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 5),
                    child: Text('-',
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
                Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 5),
                    child: Text(
                        result.resultTripsDetails?.hotelTripItineraryDetails?[0]
                                    .itemItinerary?.checkOutDate
                                    .toString() ==
                                null
                            ? ''
                            : DateFormat('MMM dd,yyyy').format(DateTime.parse(
                                result
                                        .resultTripsDetails
                                        ?.hotelTripItineraryDetails?[0]
                                        .itemItinerary!
                                        .checkOutDate
                                        .toString() ??
                                    '')),
                        style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
                Flexible(
                  flex: 2,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 50,
                    margin: const EdgeInsets.only(right: 3, left: 60, top: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      color: Colors.lightGreen.shade100,
                    ),
                    child: Center(
                        child: Text(
                      result.resultTripsDetails!.tripStatus.toString(),
                      style: TextStyle(color: Colors.green),
                    )),
                  ),
                ),
              ],
            )),
        Container(
            width: 35,
            height: viewMore ? 155 : 439,
            margin: const EdgeInsets.only(right: 9, left: 9),
            color: Colors.white,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Flexible(
                  flex: 17,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 5.0, left: 9),
                            child: Container(
                              width: 80,
                              height: 38,
                              child: Text(
                                  result
                                              .resultTripsDetails
                                              ?.hotelTripItineraryDetails?[0]
                                              .itemItinerary
                                              ?.hotelName
                                              .toString() ==
                                          null
                                      ? ''
                                      : result
                                              .resultTripsDetails
                                              ?.hotelTripItineraryDetails?[0]
                                              .itemItinerary
                                              ?.hotelName
                                              .toString() ??
                                          '',
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            )),
                        Flexible(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5.0, right: 35),
                            child: Text(
                                result
                                            .resultTripsDetails
                                            ?.hotelTripItineraryDetails?[0]
                                            .bookingRefeNo
                                            .toString() ==
                                        ''
                                    ? ''
                                    : 'Booking Ref : ' +
                                        result
                                            .resultTripsDetails!
                                            .hotelTripItineraryDetails![0]
                                            .bookingRefeNo
                                            .toString(),
                                style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline)),
                          ),
                        ),
                      ])),
              Flexible(
                  flex: 15,
                  //fit: FlexFit.loose,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 11, top: 2),
                    child: RatingBar.builder(
                        itemSize: 13,
                        allowHalfRating: true,
                        initialRating: ('FourStar' == hotelRating)
                            ? 4
                            : ('TwoStar' == hotelRating)
                                ? 2
                                : ('ThreeStar' ==
                                        result
                                            .resultTripsDetails!
                                            .hotelTripItineraryDetails?[0]
                                            .itemItinerary!
                                            .hotelRating
                                            .toString())
                                    ? 3
                                    : ('FiveStar' == hotelRating)
                                        ? 5
                                        : ('OneStar' == hotelRating)
                                            ? 1
                                            : 0,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          hotelRating;

                          return Icon(Icons.star, color: Colors.amber);
                        },
                        onRatingUpdate: (rating) => print('')),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Flexible(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(left: 9.0, top: 12),
                        child: Text('Check in',
                            style: TextStyle(
                              fontSize: 13,
                            )),
                      )),
                  Flexible(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(top: 11.0, right: 10),
                        child: Text('Check out',
                            style: TextStyle(
                              fontSize: 13,
                            )),
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, left: 9),
                    child: Text(
                      result.resultTripsDetails?.hotelTripItineraryDetails?[0]
                                  .itemItinerary?.checkInDate
                                  .toString() ==
                              null
                          ? ''
                          : DateFormat('MMM dd,yyyy').format(DateTime.parse(
                              result
                                      .resultTripsDetails
                                      ?.hotelTripItineraryDetails?[0]
                                      .itemItinerary
                                      ?.checkInDate
                                      .toString() ??
                                  '')),
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, right: 10),
                    child: Text(
                        result.resultTripsDetails?.hotelTripItineraryDetails?[0]
                                    .itemItinerary?.checkOutDate
                                    .toString() ==
                                null
                            ? ''
                            : DateFormat('MMM dd,yyyy').format(DateTime.parse(
                                result
                                        .resultTripsDetails
                                        ?.hotelTripItineraryDetails?[0]
                                        .itemItinerary
                                        ?.checkOutDate
                                        ?.toString() ??
                                    '')),
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      viewMore = !viewMore;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      viewMore ? 'View More Details' : 'Hide Details',
                    ),
                  ),
                ),
              ]),
              Visibility(
                  visible: !viewMore,
                  child: Container(
                      height: 285,
                      margin: const EdgeInsets.only(right: 9, left: 9),
                      color: Colors.white,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(color: Colors.grey, thickness: 1),
                            Flexible(
                              flex: 13,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 3.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Room Details',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        result
                                                    .resultTripsDetails
                                                    ?.hotelTripItineraryDetails?[
                                                        0]
                                                    .itemItinerary
                                                    ?.totalRooms
                                                    .toString() ==
                                                null
                                            ? ''
                                            : 0.toString() +
                                                ' Guest(s)  | ' +
                                                result
                                                    .resultTripsDetails!
                                                    .hotelTripItineraryDetails![
                                                        0]
                                                    .itemItinerary!
                                                    .totalRooms
                                                    .toString() +
                                                ' Rooms',
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 13,
                              child: Padding(
                                  padding: const EdgeInsets.only(top: 7),
                                  child: Text(
                                      result
                                              .resultTripsDetails
                                              ?.hotelTripItineraryDetails?[0]
                                              .itemItinerary
                                              ?.rooms?[index]
                                              .roomName
                                              .toString() ??
                                          '',
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey.shade600))),
                            ),
                            const Flexible(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.only(top: 13),
                                child:
                                    Divider(color: Colors.grey, thickness: 1),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Flexible(
                                  flex: 1,
                                  //fit: FlexFit.loose,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text('Guest Details',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                  ),
                                )
                              ],
                            ),
                            Flexible(
                                flex: 15,
                                //fit: FlexFit.tight,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 5),
                                  child: Text(
                                      result
                                                  .resultTripsDetails
                                                  ?.hotelTripItineraryDetails?[
                                                      0]
                                                  .itemItinerary
                                                  ?.rooms?[index]
                                                  .roomIndex
                                                  .toString() ==
                                              null
                                          ? ''
                                          : 'Room  ' +
                                              result
                                                  .resultTripsDetails!
                                                  .hotelTripItineraryDetails![
                                                      index]
                                                  .itemItinerary!
                                                  .rooms![index]
                                                  .roomIndex
                                                  .toString(),
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 11)),
                                )),
                            Flexible(
                                flex: 19,
                                child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                        result.resultTripsDetails?.tripOwnerName
                                                .toString() ??
                                            '',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold)))),
                            const Flexible(
                              flex: 1,
                              fit: FlexFit.loose,
                              child: Padding(
                                  padding: EdgeInsets.only(top: 11),
                                  child: Divider(
                                      color: Colors.grey, thickness: 1)),
                            ),
                            Row(children: const [
                              Flexible(
                                  flex: 3,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 18),
                                    child: Text('Cancellation Charges',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold)),
                                  ))
                            ]),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Flexible(
                                      flex: 1,
                                      child: Padding(
                                          padding:
                                              EdgeInsets.only(top: 5, left: 3),
                                          child: Text('From Date',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13)))),
                                  const Flexible(
                                      flex: 1,
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 5, right: 11),
                                          child: Text('To Date',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13)))),
                                  Flexible(
                                      flex: 1,
                                      child: Padding(
                                          padding:
                                              EdgeInsets.only(top: 5, right: 9),
                                          child: Text(
                                              result
                                                          .resultTripsDetails
                                                          ?.hotelTripItineraryDetails?[
                                                              index]
                                                          .itemItinerary
                                                          ?.cancellationPolicies?[
                                                              index]
                                                          .currency
                                                          .toString() ==
                                                      null
                                                  ? ''
                                                  : 'Charges ' +
                                                      '(' +
                                                      result
                                                          .resultTripsDetails!
                                                          .hotelTripItineraryDetails![
                                                              index]
                                                          .itemItinerary!
                                                          .cancellationPolicies![
                                                              index]
                                                          .currency
                                                          .toString() +
                                                      ')',
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13))))
                                ]),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                      flex: 2,
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 3, left: 3),
                                          child: Text(
                                              result.resultTripsDetails?.hotelTripItineraryDetails?[index].itemItinerary?.cancellationPolicies?[index].start
                                                          .toString() ==
                                                      null
                                                  ? ''
                                                  : DateFormat('MMM dd,yyyy')
                                                      .format(DateTime.parse(result
                                                          .resultTripsDetails!
                                                          .hotelTripItineraryDetails![
                                                              index]
                                                          .itemItinerary!
                                                          .cancellationPolicies![index]
                                                          .start
                                                          .toString())),
                                              style: const TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold)))),
                                  Flexible(
                                      flex: 3,
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 3, right: 43, left: 2),
                                          child: Text(
                                              result.resultTripsDetails?.hotelTripItineraryDetails?[index].itemItinerary?.cancellationPolicies?[index].end
                                                          .toString() ==
                                                      null
                                                  ? ''
                                                  : DateFormat('MMM dd,yyyy')
                                                      .format(DateTime.parse(result
                                                          .resultTripsDetails!
                                                          .hotelTripItineraryDetails![
                                                              index]
                                                          .itemItinerary!
                                                          .cancellationPolicies![index]
                                                          .end
                                                          .toString())),
                                              style: const TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold)))),
                                  Flexible(
                                      flex: 2,
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 3, right: 29),
                                          child: Text(
                                              result
                                                          .resultTripsDetails
                                                          ?.hotelTripItineraryDetails?[
                                                              index]
                                                          .itemItinerary
                                                          ?.cancellationPolicies?[
                                                              index]
                                                          .chargeValue
                                                          .toString() ==
                                                      null
                                                  ? ''
                                                  : result
                                                      .resultTripsDetails!
                                                      .hotelTripItineraryDetails![
                                                          index]
                                                      .itemItinerary!
                                                      .cancellationPolicies![
                                                          index]
                                                      .chargeValue
                                                      .toString(),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight:
                                                      FontWeight.bold))))
                                ]),
                            const Flexible(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(top: 12),
                                child:
                                    Divider(color: Colors.grey, thickness: 1),
                              ),
                            ),
                            Flexible(
                              flex: 23,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 18, left: 5),
                                child: Text(
                                    result
                                                .resultTripsDetails
                                                ?.hotelTripItineraryDetails?[0]
                                                .itemItinerary
                                                ?.inPolicy
                                                .toString() ==
                                            null
                                        ? ''
                                        : result
                                                    .resultTripsDetails
                                                    ?.hotelTripItineraryDetails![
                                                        0]
                                                    .itemItinerary
                                                    ?.inPolicy
                                                    .toString() ==
                                                'true'
                                            ? 'Company Policy'
                                            : '',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Flexible(
                                flex: 24,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text(
                                      result
                                                  .resultTripsDetails
                                                  ?.hotelTripItineraryDetails?[
                                                      0]
                                                  .itemItinerary
                                                  ?.inPolicy
                                                  .toString() ==
                                              null
                                          ? ''
                                          : result
                                                      .resultTripsDetails
                                                      ?.hotelTripItineraryDetails?[
                                                          0]
                                                      .itemItinerary
                                                      ?.inPolicy
                                                      .toString() ==
                                                  'true'
                                              ? 'In Policy'
                                              : '',
                                      style: const TextStyle(
                                          color: Colors.green,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                )),
                          ])))
            ]))
      ]);
    }
    return Center(
        child: Text('Data Is Not Available',
            style: TextStyle(
                fontSize: 25,
                color: Colors.blue,
                fontWeight: FontWeight.bold)));
  }
}
