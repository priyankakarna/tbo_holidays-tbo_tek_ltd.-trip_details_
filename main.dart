import 'package:trip_details_new_project/network_tripDetails.dart';
import './trips_details_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'tabs/upcoming_tab_view.dart';
import 'package:trip_details_new_project/tabs/past_tab_view.dart';
import './network_class.dart';
import 'package:intl/intl.dart';
import './network_of_past_tab.dart';
import 'models/get_trip_details_model.dart';
import 'models/get_trip_list_details_model.dart';
import 'tabs/trip_details_tab_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  void getTrips() async {
    TripsdetailsDatabase tripsDatabase = TripsdetailsDatabase.instance;
    final res = await tripsDatabase.getTripsList();
    print('upcoming' + res.toString());

    await tripsDatabase.getTripsListOfPast();
  }

  @override
  void initState() {
    super.initState();
    getTrips();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
          elevation: 2,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(label: 'Trips', icon: Icon(Icons.flight)),
            BottomNavigationBarItem(label: 'Book', icon: Icon(Icons.book)),
            BottomNavigationBarItem(
              label: 'Notification',
              tooltip: 'Notification',
              icon: Icon(Icons.notifications),
            ),
            BottomNavigationBarItem(label: 'Conceirge', icon: Icon(Icons.hotel))
          ]),
      appBar: AppBar(
        actions: [
          Padding(
              padding: const EdgeInsets.all(13.0),
              child: Stack(children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 150,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(19.0),
                  ),
                  child: Container(
                    width: 70,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.0),
                      color: Colors.white,
                    ),
                    child: Row(children: const [
                      Expanded(
                          flex: 26,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 10, top: 5, bottom: 5, right: 10),
                            child: Text('All  Trips',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 13)),
                          )),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 3, left: 76, bottom: 3, right: 0.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(7),
                        bottomRight: Radius.circular(7)),
                    clipBehavior: Clip.hardEdge,
                    child: Container(
                        width: 72,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          //borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 8, top: 5, bottom: 5, right: 8),
                          child: Text('  My Trips ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12)),
                        )),
                  ),
                )
              ]))
        ],
        title: const Text('Trips'),
        backgroundColor: Colors.black,
      ),
      drawer: const Drawer(),
      body: ListView(children: [
        DefaultTab(),
      ]),
    ));
  }
}

class DefaultTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DefaultTabState();
  }
}

class DefaultTabState extends State<DefaultTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: SizedBox(
            height: 10000,
            child: ListView(children: [
              Container(
                color: Colors.black12,
                width: 450,
                height: 49,
                child: const TabBar(
                  indicator: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.blue, width: 3),
                        left: BorderSide(color: Colors.white)),
                  ),
                  tabs: [
                    Text('Upcoming', style: TextStyle(color: Colors.black)),
                    Text('Past', style: TextStyle(color: Colors.black))
                  ],
                ),
              ),
              Search(context),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: TabBarView(children: [UpcomingTrip(), PastTrip()]),
              ),
            ])));
  }

  Widget Search(context) {
    return Container(
      width: 221,
      height: 56,
      decoration: const BoxDecoration(),
      child: Padding(
          padding: const EdgeInsets.only(left: 13, bottom: 3, top: 0.0),
          child: Row(children: const [
            Flexible(
              flex: 2,
              child: Icon(Icons.search, size: 25),
            ),
            Expanded(
              flex: 27,
              child: Padding(
                padding: EdgeInsets.only(left: 14, bottom: 0.6),
                child: TextField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 0.0, bottom: 150),
                      labelText: 'Search',
                      suffixIcon: Icon(Icons.close, size: 25)),
                ),
              ),
            ),
          ])),
    );
  }
}
