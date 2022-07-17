import 'package:flutter/';
import 'package:trip_details_new_project/models/get_trip_details_model.dart';
import 'package:trip_details_new_project/network_of_past_tab.dart';
import 'package:intl/intl.dart';
import 'package:trip_details_new_project/main.dart';
import 'package:trip_details_new_project/trips_details_database.dart';
import './trip_details_tab_view.dart';

class PastTrip extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PastTripState();
  }
}

class PastTripState extends State<PastTrip> {
  @override
  Widget build(BuildContext context) {
    return
//DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(savedDateString);

//String date = DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now());
        FutureBuilder<List<Map<String, dynamic>>>(
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  print('Snapshot is ' + snapshot.data.toString());

                  return CreateListViewPastTab(context, snapshot.data);
                }
              }
              return Center(child: CircularProgressIndicator());
            },
            future: TripsdetailsDatabase.instance.getTripsListOfPast());
  }

  Widget CreateListViewPastTab(
      context, List<Map<String, dynamic>>? getTripsReesult) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: getTripsReesult!.length,
        itemBuilder: (context, int index) {
          return Column(
            children: [
              InkWell(
                onTap: () async {
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Tripdetails(
                              tripId: getTripsReesult[index]['TripId'])));
                },
                child: Container(
                  width: 500,
                  height: 150,
                  margin: EdgeInsets.only(left: 12, right: 12, top: 15),
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
                                          '${getTripsReesult[index]['TripName']}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 15)),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: SizedBox(
                                        width: 40,
                                        height: 30,
                                        child: Text(
                                            DateFormat('dd MMM')
                                                .format(DateTime.parse(
                                                    '${getTripsReesult[index]['StartDate']}'
                                                        .toString()))
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(right: 9, left: 2),
                                      width: 15,
                                      child: const Center(
                                        child: Text(
                                          '-',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    Text(
                                        DateFormat('dd MMM')
                                            .format(DateTime.parse(
                                                '${getTripsReesult[index]['EndDate']}'
                                                    .toString()))
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600)),
                                  ])),
                          Flexible(
                            flex: 15,
                            child: Row(children: [
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, bottom: 25),
                                  child: Text(
                                      '${getTripsReesult[index]['TripOwnerName']}',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600)))
                            ]),
                          ),
                          Flexible(
                            flex: 5,
                            child: Container(
                              margin: EdgeInsets.only(top: 1, bottom: 650),
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
                                  // margin: EdgeInsets.only(bottom: 5),
                                  height: 23,
                                  width: '${getTripsReesult[index]['TripStatus']}' ==
                                          'Draft'
                                      ? 50
                                      : '${getTripsReesult[index]['TripStatus']}' ==
                                              'Booked'
                                          ? 70
                                          : 90,
                                  decoration: BoxDecoration(
                                      color:
                                          '${getTripsReesult[index]['TripStatus']}' ==
                                                  'Booked'
                                              ? Colors.green.shade100
                                              : Colors.grey.shade400,
                                      border:
                                          '${getTripsReesult[index]['TripStatus']}' ==
                                                  'Booked'
                                              ? Border.all(
                                                  color: Colors.green, width: 2)
                                              : Border.all(
                                                  color: Colors.grey,
                                                  width: 2)),
                                  child: Center(
                                      child: Text(
                                    '${getTripsReesult[index]['TripStatus']}',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            '${getTripsReesult[index]['TripStatus']}' ==
                                                    'Booked'
                                                ? Colors.green
                                                : Colors.grey.shade600),
                                  )),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 2, right: 5, bottom: 11),
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 2, right: 5, bottom: 11),
                                      child: getTripsReesult[index]
                                                      ['ServiceTypeList'] ==
                                                  'TransferFlightHotel' ||
                                              getTripsReesult[index]
                                                      ['ServiceTypeList'] ==
                                                  'TransferHotelFlight' ||
                                              getTripsReesult[index]
                                                      ['ServiceTypeList'] ==
                                                  'HotelTransferFlight' ||
                                              getTripsReesult[index]
                                                      ['ServiceTypeList'] ==
                                                  'FlightTransferHotel' ||
                                              getTripsReesult[index]
                                                      ['ServiceTypeList'] ==
                                                  'FlightHotelTransfer' ||
                                              getTripsReesult[index]
                                                      ['ServiceTypeList'] ==
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
                                                ])
                                          : getTripsReesult[index]
                                                          ['ServiceTypeList'] ==
                                                      'HotelFlight' ||
                                                  getTripsReesult[index]
                                                          ['ServiceTypeList'] ==
                                                      'FlightHotel'
                                              ? Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 9.0),
                                                    child: Icon(Icons.flight,
                                                        size: 26,
                                                        color: Colors.black),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 1.0),
                                                    child: Icon(Icons.hotel,
                                                        size: 26,
                                                        color: Colors.black),
                                                  ),
                                                ])
                                              : getTripsReesult[index]['ServiceTypeList'] == 'HotelTransfer' || getTripsReesult[index]['ServiceTypeList'] == 'TransferHotel'
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
                                                        child: Icon(Icons.hotel,
                                                            size: 25,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ])
                                                  : getTripsReesult[index]['ServiceTypeList'] == "TransferFlight" || getTripsReesult[index]['ServiceTypeList'] == "FlightTransfer"
                                                      ? Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      right:
                                                                          25.0),
                                                              child: Icon(
                                                                  Icons
                                                                      .car_rental,
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
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ])
                                                      : (getTripsReesult[index]['ServiceTypeList'] == "Hotel"
                                                          ? const Icon(Icons.hotel, size: 26, color: Colors.black)
                                                          : getTripsReesult[index]['ServiceTypeList'] == "Transfer"
                                                              ? const Icon(Icons.car_rental, size: 26, color: Colors.black)
                                                              : getTripsReesult[index]['ServiceTypeList'] == "Flight"
                                                                  ? const Icon(Icons.flight, size: 26, color: Colors.black)
                                                                  : const Icon(Icons.hotel, size: 26, color: Colors.black))))
                            ],
                          )
                        ]),
                  ),
                ),
              )
            ],
          );
        });
  }
}
