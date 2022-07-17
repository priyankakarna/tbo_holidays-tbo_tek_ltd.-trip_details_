import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart';
import 'models/get_trip_details_model.dart';
import './network_class.dart';
import './network_of_past_tab.dart';
import 'package:trip_details_new_project/tabs/upcoming_tab_view.dart';
import 'package:trip_details_new_project/tabs/past_tab_view.dart';
import './main.dart';

class TripsdetailsDatabase {
  final _dbName = 'UserTrips.db';
  final _dbVersion = 1;

  final String tableName = 'TripList';
  String tripName = 'TripName';
  String tripOwnerName = 'TripOwnerName';
  String tripStatus = 'TripStatus';
  String tripId = 'TripId';
  String startDate = 'StartDate';
  String endDate = 'EndDate';
  String serviceTypeList = 'ServiceTypeList';

  TripsdetailsDatabase._privateconstructor();
  static final TripsdetailsDatabase instance =
      TripsdetailsDatabase._privateconstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDB();
    String newDbPath = await getDatabasesPath();
    databaseExist(join(newDbPath, _dbName));

    return _database!;
  }

  Future<Database> _initDB() async {
    String dbpath = await getDatabasesPath();
    String path = join(dbpath, _dbName);

    return await openDatabase(path, version: 1, onCreate: createdb);
  }

  Future createdb(Database db, int version) async {
    print('create table');
    await db.execute('''


        CREATE TABLE IF NOT EXISTS $tableName(
         $tripId INTEGER UNIQUE,
         $tripName TEXT NOT NULL,
         $tripOwnerName TEXT NOT NULL,
         $startDate DATETIME  NOT NULL,
         $endDate DATETIME NOT NULL,
         $tripStatus TEXT NOT NULL,
         $serviceTypeList  TEXT NOT NULL
         ) 


        ''');
  }

  Future<bool> databaseExist(String path) async {
    bool exists = await databaseExists(path);
    print('Database exists' + '\t' + exists.toString() + '\t' + _dbName);
    return exists;
  }

  insertTrip(TripViewModel newresults) async {
    final db = await database;
    print('length of upcoming' + newresults.tripsResult!.length.toString());
    print('upcoming trip last trip' +
        newresults.tripsResult!.last.tripName.toString());
    print('upcoming trip first trip' +
        newresults.tripsResult!.first.tripName.toString());
    //for (int i = 0; i < newresults.tripsResult!.length; i++) {
    for (int i = 0; i < newresults.tripsResult!.length; i++) {
      final res = db.insert('$tableName', newresults.tripsResult![i].toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
      print(
          'upcoming triplist' + newresults.tripsResult![i].toJson().toString());
    }
  }

  Future<List<Map<String, dynamic>>> getTripsList() async {
    print('trip details');
    print('results are ');

    final db = await database;
    // int now = DateTime.now().millisecondsSinceEpoch;

    final tripsDetails = await db.rawQuery(
        'Select DISTINCT $tripId,$tripName,$tripOwnerName,$tripStatus,$startDate,$endDate,$serviceTypeList   FROM $tableName WHERE $endDate > datetime("now")  ORDER BY  $tripId  DESC');

    print('gettriplist' + tripsDetails.toString());
    print(tripsDetails);
    return tripsDetails;
  }

  Future<List<Map<String, dynamic>>> getTripsListOfPast() async {
    print('trip details');
    print('results are ');

    final db = await database;

    final tripsDetailsofPast = await db.rawQuery(
        '''Select DISTINCT $tripId,$tripName,$tripOwnerName,$tripStatus,$startDate,$endDate,$serviceTypeList FROM $tableName WHERE $endDate<datetime('now') ORDER BY $tripId DESC''');

    print('gettriplistof past' + tripsDetailsofPast.toString());
    print(tripsDetailsofPast);
    return tripsDetailsofPast;
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}
