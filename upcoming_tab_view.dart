import 'package:trip_details_new_project/models/get_trip_details_model.dart';
import 'package:trip_details_new_project/models/get_trip_list_details_model.dart';
import 'package:trip_details_new_project/trips_details_database.dart';
import 'package:flutter/material.dart';
import 'package:trip_details_new_project/network_class.dart';
import './past_tab_view.dart';
import 'package:intl/intl.dart';
import 'package:trip_details_new_project/tabs/trip_details_tab_view.dart';

class UpcomingTrip extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UpcomingTripState();
  }
}

class UpcomingTripState extends State<UpcomingTrip> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              print(' snapshot data ' +
                  '' +
                  snapshot.data.runtimeType.toString());

              print('in list');

              return CreateListView(context, snapshot.data);
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
        future: TripsdetailsDatabase.instance.getTripsList());
  }

  Widget CreateListView(context, List<Map<String, dynamic>>? getTripsResult) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: getTripsResult!.length,
        itemBuilder: (context, int index) {
          return Column(
            children: [
              InkWell(
                onTap: () async {
                  await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Tripdetails(
                          tripId: getTripsResult[index]['TripId'])));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  margin: const EdgeInsets.only(left: 12, right: 12, top: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade100, spreadRadius: 4)
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 7, top: 13, right: 7),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                              flex: 5,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 9,
                                      child: Text(
                                        '${getTripsResult[index]['TripName']}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 15),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: SizedBox(
                                        width: 40,
                                        height: 30,
                                        child: Text(
                                            DateFormat('dd MMM')
                                                .format(DateTime.parse(
                                                    '${getTripsResult[index]['StartDate']}'
                                                        .toString()))
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          right: 9, left: 2),
                                      width: 15,
                                      child: const Center(
                                        child: Text(
                                          '-',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    Text(
                                        DateFormat('dd MMM')
                                            .format(DateTime.parse(
                                                '${getTripsResult[index]['EndDate']}'
                                                    .toString()))
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600)),
                                  ])),
                          Flexible(
                            flex: 14,
                            child: Row(children: [
                              const Padding(
                                  padding: EdgeInsets.only(
                                      top: 15.0, bottom: 25, left: 2)),
                              Text('${getTripsResult[index]['TripOwnerName']}',
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500)),
                            ]),
                          ),
                          Flexible(
                            flex: 5,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(top: 1, bottom: 650),
                              height: 3,
                              width: 400,
                              child: Divider(
                                color: Colors.grey.shade300,
                                thickness: 2,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 2.0, bottom: 6),
                                child: Container(
                                  height: 23,
                                  width: '${getTripsResult[index]['TripStatus']}' ==
                                          'Draft'
                                      ? 50
                                      : '${getTripsResult[index]['TripStatus']}' ==
                                              'Booked'
                                          ? 70
                                          : 90,
                                  decoration: BoxDecoration(
                                      color:
                                          '${getTripsResult[index]['TripStatus']}' ==
                                                  'Booked'
                                              ? Colors.green.shade100
                                              : Colors.grey.shade400,
                                      border:
                                          '${getTripsResult[index]['TripStatus']}' ==
                                                  'Booked'
                                              ? Border.all(
                                                  color: Colors.green, width: 2)
                                              : Border.all(
                                                  color: Colors.grey,
                                                  width: 2)),
                                  child: Center(
                                      child: Text(
                                    '${getTripsResult[index]['TripStatus']}',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            '${getTripsResult[index]['TripStatus']}' ==
                                                    'Booked'
                                                ? Colors.green
                                                : Colors.grey.shade600),
                                  )),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 2, right: 5, bottom: 11),
                                  child: getTripsResult[index]
                                                  ['ServiceTypeList'] ==
                                              'TransferFlightHotel' ||
                                          getTripsResult[index]['ServiceTypeList'] ==
                                              'TransferHotelFlight' ||
                                          getTripsResult[index]['ServiceTypeList'] ==
                                              'HotelTransferFlight' ||
                                          getTripsResult[index]['ServiceTypeList'] ==
                                              'FlightTransferHotel' ||
                                          getTripsResult[index]['ServiceTypeList'] ==
                                              'FlightHotelTransfer' ||
                                          getTripsResult[index]['ServiceTypeList'] ==
                                              'HotelFlightTransfer'
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: const [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: 25.0),
                                                child: Icon(Icons.flight,
                                                    size: 26,
                                                    color: Colors.black),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: 20.0),
                                                child: Icon(Icons.hotel,
                                                    size: 25,
                                                    color: Colors.black),
                                              ),
                                              Icon(Icons.car_rental,
                                                  size: 25, color: Colors.black)
                                            ])
                                      : getTripsResult[index]['ServiceTypeList'] ==
                                                  'HotelFlight' ||
                                              getTripsResult[index]['ServiceTypeList'] ==
                                                  'FlightHotel'
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: const [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 25.0),
                                                    child: Icon(Icons.flight,
                                                        size: 26,
                                                        color: Colors.black),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 20.0),
                                                    child: Icon(Icons.hotel,
                                                        size: 25,
                                                        color: Colors.black),
                                                  ),
                                                ])
                                          : getTripsResult[index]['ServiceTypeList'] ==
                                                      'HotelTransfer' ||
                                                  getTripsResult[index]
                                                          ['ServiceTypeList'] ==
                                                      'TransferHotel'
                                              ? Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 25.0),
                                                      child: Icon(
                                                          Icons.car_rental,
                                                          size: 25,
                                                          color: Colors.black)),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 5.0),
                                                    child: Icon(Icons.hotel,
                                                        size: 25,
                                                        color: Colors.black),
                                                  ),
                                                ])
                                              : getTripsResult[index]['ServiceTypeList'] == "TransferFlight" || getTripsResult[index]['ServiceTypeList'] == "FlightTransfer"
                                                  ? Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 25.0),
                                                          child: Icon(
                                                              Icons.car_rental,
                                                              size: 25,
                                                              color: Colors
                                                                  .black)),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 5.0),
                                                        child: Icon(
                                                            Icons.flight,
                                                            size: 25,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ])
                                                  : (getTripsResult[index]['ServiceTypeList'] == "Hotel"
                                                      ? const Icon(Icons.hotel, size: 26, color: Colors.black)
                                                      : getTripsResult[index]['ServiceTypeList'] == "Transfer"
                                                          ? const Icon(Icons.car_rental, size: 26, color: Colors.black)
                                                          : getTripsResult[index]['ServiceTypeList'] == "Flight"
                                                              ? const Icon(Icons.flight, size: 26, color: Colors.black)
                                                              : const Icon(Icons.hotel, size: 26, color: Colors.black)))
                            ],
                          )
                        ]),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
