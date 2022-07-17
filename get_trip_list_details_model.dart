import 'dart:convert';

class TripDetailsModel {
  Result? resultTripsDetails;
  bool? isSuccess;
  List<dynamic>? errors;
  List<dynamic>? alerts;

  TripDetailsModel(
      {this.resultTripsDetails, this.isSuccess, this.errors, this.alerts});

  factory TripDetailsModel.fromJson(Map<String, dynamic> json) {
    return TripDetailsModel(
      resultTripsDetails:
          json['Result'] == null ? null : Result.fromJson(json['Result']),
      isSuccess: json['IsSuccess'] == null ? null : json['IsSuccess'],
      errors: json['Errors'] == null ? null : json['Errors'],
      alerts: json['Alerts'] == null ? null : json['Alerts'],
    );
  }

  Map<String, dynamic> toJson() => {
        'Result':
            resultTripsDetails == null ? null : resultTripsDetails!.toJson(),
        'IsSuccess': isSuccess == null ? null : isSuccess,
        'Alerts': List<Null>.from(alerts!.map((x) => x)),
        'Errors': List<Null>.from(errors!.map((x) => x)),
      };
}

class Result {
  int? tripId;
  String? tripName;
  List<dynamic>? serviceTypeList;
  String? startDate;
  String? endDate;
  int? tripOwner;
  String? tripOwnerName;
  List<int>? tripUsers;
  int? paxCount;
  double? tripPrice;
  String? tripCurrency;
  String? tripType;
  String? tripStatus;
  List<dynamic>? flightTripItineraryDetails;
  List<HotelTripItineraryDetails>? hotelTripItineraryDetails;
  List<dynamic>? transferTripItineraryDetails;
  List<dynamic>? trainTripItineraryDetails;
  TripBillingDetails? tripBillingDetails;
  int? corporateId;
  int? agencyId;
  int? createdBy;
  String? lastModifiedOn;
  String? clientType;
  List<dynamic>? dutyOfCareDetails;
  bool? isViaPg;
  List<dynamic>? customFields;
  List<dynamic>? formOfPaymentDetail;
  String? tripPaymentStatus;
  String? pgSource;
  double? merchantFeesInPercent;

  Result(
      {this.tripId,
      this.tripName,
      this.serviceTypeList,
      this.startDate,
      this.endDate,
      this.tripOwner,
      this.tripOwnerName,
      this.tripUsers,
      this.paxCount,
      this.tripPrice,
      this.tripCurrency,
      this.tripType,
      this.tripStatus,
      this.flightTripItineraryDetails,
      this.hotelTripItineraryDetails,
      this.transferTripItineraryDetails,
      this.trainTripItineraryDetails,
      this.tripBillingDetails,
      this.corporateId,
      this.agencyId,
      this.createdBy,
      this.lastModifiedOn,
      this.clientType,
      this.dutyOfCareDetails,
      this.isViaPg,
      this.customFields,
      this.formOfPaymentDetail,
      this.tripPaymentStatus,
      this.pgSource,
      this.merchantFeesInPercent});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      tripId: json['TripId'] == null ? null : json['TripId'],
      tripName: json['TripName'] == null ? null : json['TripName'],
      serviceTypeList:
          json['ServiceTypeList'] == null ? null : json['ServiceTypeList'],
      startDate: json['StartDate'] == null
          ? null
          : DateTime.parse(json['StartDate']).toString(),
      endDate: json['EndDate'] == null
          ? null
          : DateTime.parse(json['EndDate']).toString(),
      tripOwner: json['TripOwner'] == null ? null : json['TripOwner'],
      tripOwnerName:
          json['TripOwnerName'] == null ? null : json['TripOwnerName'],
      tripUsers: json['TripUsers'] == null
          ? null
          : List<int>.from(json['TripUsers'].map((x) => x)),
      paxCount: json['PaxCount'] == null ? null : json['PaxCount'],
      tripPrice: json['TripPrice'] == null ? null : json['TripPrice'],
      tripCurrency: json['TripCurrency'] == null ? null : json['TripCurrency'],
      tripType: json['TripType'] == null ? null : json['TripType'],
      tripStatus: json['TripStatus'] == null ? null : json['TripStatus'],
      flightTripItineraryDetails: json['FlightTripItineraryDetails'] == null
          ? null
          : json['FlightTripItineraryDetails'],
      hotelTripItineraryDetails: json['HotelTripItineraryDetails'] == null
          ? null
          : List<HotelTripItineraryDetails>.from(
              json['HotelTripItineraryDetails']
                  .map((x) => HotelTripItineraryDetails.fromJson(x))),
      transferTripItineraryDetails: json['TransferTripItineraryDetails'] == null
          ? null
          : json['TransferTripItineraryDetails'],
      trainTripItineraryDetails: json['TrainTripItineraryDetails'] == null
          ? null
          : json['TrainTripItineraryDetails'],
      tripBillingDetails: json['TripBillingDetails'] == null
          ? null
          : TripBillingDetails.fromJson(json['TripBillingDetails']),
      corporateId: json['CorporateId'] == null ? null : json['CorporateId'],
      agencyId: json['AgencyId'] == null ? null : json['AgencyId'],
      createdBy: json['CreatedBy'] == null ? null : json['CreatedBy'],
      lastModifiedOn: json['LastModifiedOn'] == null
          ? null
          : DateTime.parse(json['LastModifiedOn']).toString(),
      clientType: json['ClientType'] == null ? null : json['ClientType'],
      dutyOfCareDetails:
          json['DutyOfCareDetails'] == null ? null : json['DutyOfCareDetails'],
      isViaPg: json['IsViaPG'] == null ? null : json['IsViaPG'],
      customFields: json['CustomFields'] == null ? null : json['CustomFields'],
      formOfPaymentDetail: json['FormOfPaymentDetail'] == null
          ? null
          : json['FormOfPaymentDetail'],
      tripPaymentStatus:
          json['TripPaymentStatus'] == null ? null : json['TripPaymentStatus'],
      pgSource: json['PGSource'] == null ? null : json['PGSource'],
      merchantFeesInPercent: json['MerchantFeesInPercent'] == null
          ? null
          : json['MerchantFeesInPercent'],
    );
  }

  Map<String, dynamic> toJson() => {
        'TripId': tripId == null ? null : tripId,
        'TripName': tripName == null ? null : tripName,
        'ServiceTypeList': serviceTypeList == null
            ? null
            : List<Null>.from(serviceTypeList!.map((x) => x)),
        'StartDate': startDate == null ? null : startDate,
        'EndDate': endDate == null ? null : endDate,
        'TripOwner': tripOwner == null ? null : tripOwner,
        'TripOwnerName': tripOwnerName == null ? null : tripOwnerName,
        'TripUsers':
            tripUsers == null ? null : List<int>.from(tripUsers!.map((x) => x)),
        'PaxCount': paxCount == null ? null : paxCount,
        'TripPrice': tripPrice == null ? null : tripPrice,
        'TripType': tripType == null ? null : tripType,
        'TripStatus': tripStatus == null ? null : tripStatus,
        'TripCurrency': tripCurrency == null ? null : tripCurrency,
        'FlightTripItineraryDetails': flightTripItineraryDetails == null
            ? null
            : flightTripItineraryDetails!.map((x) => x),
        'HotelTripItineraryDetails': hotelTripItineraryDetails == null
            ? null
            : hotelTripItineraryDetails!.map((x) => x),
        'TrainTripItineraryDetails': trainTripItineraryDetails == null
            ? null
            : trainTripItineraryDetails!.map((x) => x),
        'TransferTripItineraryDetails': transferTripItineraryDetails == null
            ? null
            : transferTripItineraryDetails!.map((x) => x),
        'TripBillingDetails':
            tripBillingDetails == null ? null : tripBillingDetails!.toJson(),
        'CorporateId': corporateId == null ? null : corporateId,
        'AgencyId': agencyId == null ? null : agencyId,
        'CreatedBy': createdBy == null ? null : createdBy,
        'LastModifiedOn': lastModifiedOn == null ? null : lastModifiedOn,
        'ClientType': clientType == null ? null : clientType,
        'DutyOfCareDetails': dutyOfCareDetails == null
            ? null
            : List<Null>.from(dutyOfCareDetails!.map((x) => x)),
        'IsViaPG': isViaPg == null ? null : isViaPg,
        'CustomFields':
            customFields == null ? null : customFields!.map((x) => x),
        'FormOfPaymentDetail': formOfPaymentDetail == null
            ? null
            : formOfPaymentDetail!.map((x) => x),
        'TripPaymentStatus':
            tripPaymentStatus == null ? null : tripPaymentStatus,
        'PGSource': pgSource == null ? null : pgSource,
        'MerchantFeesInPercent':
            merchantFeesInPercent == null ? null : merchantFeesInPercent,
      };
}

class HotelTripItineraryDetails {
  ItemItinerary? itemItinerary;
  List<dynamic>? userPreferences;
  PolicyViolation? policyViolation;
  int? tripItineraryDetailId;
  String? startDate;
  String? endDate;
  String? servicePlaces;
  int? journeyType;
  String? serviceType;
  String? serviceStatus;
  bool? isFareAvailable;
  double? serviceCost;
  String? bookingRefeNo;
  String? createdOn;
  int? tripIndicator;
  bool? isClientTrip;

  HotelTripItineraryDetails(
      {this.itemItinerary,
      this.userPreferences,
      this.policyViolation,
      this.tripItineraryDetailId,
      this.startDate,
      this.endDate,
      this.servicePlaces,
      this.journeyType,
      this.serviceType,
      this.serviceStatus,
      this.isFareAvailable,
      this.serviceCost,
      this.bookingRefeNo,
      this.createdOn,
      this.tripIndicator,
      this.isClientTrip});

  factory HotelTripItineraryDetails.fromJson(Map<String, dynamic> json) {
    return HotelTripItineraryDetails(
      itemItinerary: json['ItemItinerary'] == null
          ? null
          : ItemItinerary.fromJson(json['ItemItinerary']),
      userPreferences:
          json['UserPrefernces'] == null ? null : json['UserPrefernces'],
      policyViolation: json['PolicyViolations'] == null
          ? null
          : PolicyViolation.fromJson(json['PolicyViolations']),
      tripItineraryDetailId: json['TripItineraryDetailId'] == null
          ? null
          : json['TripItineraryDetailId'],
      startDate: json['StartDate'] == null
          ? null
          : DateTime.parse(json['StartDate']).toString(),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate']).toString(),
      servicePlaces:
          json['ServicePlaces'] == null ? null : json['ServicePlaces'],
      journeyType: json['JourneyType'] == null ? null : json['JourneyType'],
      serviceType: json['ServiceType'] == null ? null : json['ServiceType'],
      serviceStatus:
          json['ServiceStatus'] == null ? null : json['ServiceStatus'],
      isFareAvailable:
          json['IsFareAvailable'] == null ? null : json['IsFareAvailable'],
      serviceCost: json['ServiceCost'] == null ? null : json['ServiceCost'],
      bookingRefeNo: json['BookingRefNo'] == null ? null : json['BookingRefNo'],
      createdOn: json['CreatedOn'] == null
          ? null
          : DateTime.parse(json['CreatedOn']).toString(),
      tripIndicator:
          json['TripIndicater'] == null ? null : json['TripIndicater'],
      isClientTrip: json['IsClientTrip'] == null ? null : json['IsClientTrip'],
    );
  }

  Map<String, dynamic> toJson() => {
        'ItemItinerary': itemItinerary == null ? null : itemItinerary!.toJson(),
        'UserPrefernces':
            userPreferences == null ? null : userPreferences!.map((x) => x),
        'PolicyViolation':
            policyViolation == null ? null : policyViolation!.toJson(),
        'TripItineraryDetailId':
            tripItineraryDetailId == null ? null : tripItineraryDetailId,
        'TripIndicater': tripIndicator == null ? null : tripIndicator,
        'StartDate': startDate == null ? null : startDate,
        'EndDate': endDate == null ? null : endDate,
        'ServicePlaces': servicePlaces == null ? null : servicePlaces,
        'ServiceCost': serviceCost == null ? null : serviceCost,
        'ServiceStatus': serviceStatus == null ? null : serviceStatus,
        'JourneyType': journeyType == null ? null : journeyType,
        'ServiceType': serviceType == null ? null : serviceType,
        'IsFareAvailable': isFareAvailable == null ? null : isFareAvailable,
        'BookingRefNumber': bookingRefeNo == null ? null : bookingRefeNo,
        'CreatedOn': createdOn == null ? null : createdOn,
        'IsClientTrip': isClientTrip == null ? null : isClientTrip,
      };
}

class ItemItinerary {
  int? bookingId;
  int? parentBookingId;
  int? corporateId;
  int? hotelId;
  int? requestSentBookingId;
  String? companyCode;
  String? supplierConfirmationNo;
  String? supplierBookingRefNo;
  String? tboRefNo;
  int? tripId;
  int? tripType;
  int? tripItineraryDetailId;
  String? checkInDate;
  String? checkOutDate;
  int? sourceId;
  String? sourceName;
  String? sourceStatus;
  bool? voucherStatus;
  DateTime? voucheredOn;
  String? nationality;
  int? totalRooms;
  int? totalPax;
  String? bookedForm;
  String? sessionId;
  String? uAPISessionId;
  String? lastCancellationDate;
  List<CancellationPolicies>? cancellationPolicies;
  List<Rooms>? rooms;
  dynamic requestType;
  bool? isGuestMailRequired;
  bool? isPostPay;
  bool? hasChannelManagerSource;
  int? agencyId;
  String? agencyName;
  int? memeberId;
  String? memeberName;
  int? loggedInAgencyId;
  int? loggedInMemberId;
  bool? isfromQueue;
  bool? isSentForApprove;
  bool? isBooked;
  bool? isDrafted;
  int? tboHotelCode;
  String? supplierHotelCode;
  String? hotelName;
  String? hotelRating;
  String? hotelImage;
  int? cityId;
  String? cityName;
  String? country;
  String? countryCode;
  String? hotelNorms;
  double? latitude;
  double? longitude;
  String? createdOn;
  int? lastModifiedBy;
  String? lastModifiedOn;
  bool? isImport;
  bool? isManual;
  bool? changeRequestExists;
  String? changeRequestStatus;
  int? paymentGatewaySourceId;
  int? billingEntityId;
  int? costCenterId;
  bool? billedToClient;
  bool? inPolicy;
  Invoice? invoice;
  bool? isPANRequiredForBooking;

  ItemItinerary(
      {this.supplierConfirmationNo,
      this.isfromQueue,
      this.agencyId,
      this.agencyName,
      this.billedToClient,
      this.billingEntityId,
      this.bookedForm,
      this.bookingId,
      this.cancellationPolicies,
      this.changeRequestExists,
      this.checkInDate,
      this.checkOutDate,
      this.changeRequestStatus,
      this.cityId,
      this.cityName,
      this.companyCode,
      this.corporateId,
      this.costCenterId,
      this.country,
      this.countryCode,
      this.createdOn,
      this.hasChannelManagerSource,
      this.hotelId,
      this.hotelImage,
      this.hotelName,
      this.hotelNorms,
      this.hotelRating,
      this.inPolicy,
      this.invoice,
      this.isBooked,
      this.isDrafted,
      this.isGuestMailRequired,
      this.isImport,
      this.isManual,
      this.isPANRequiredForBooking,
      this.isPostPay,
      this.isSentForApprove,
      this.lastCancellationDate,
      this.lastModifiedBy,
      this.lastModifiedOn,
      this.latitude,
      this.loggedInAgencyId,
      this.loggedInMemberId,
      this.longitude,
      this.memeberId,
      this.memeberName,
      this.nationality,
      this.parentBookingId,
      this.paymentGatewaySourceId,
      this.requestSentBookingId,
      this.requestType,
      this.rooms,
      this.sessionId,
      this.sourceId,
      this.sourceName,
      this.sourceStatus,
      this.supplierBookingRefNo,
      this.supplierHotelCode,
      this.tboHotelCode,
      this.tboRefNo,
      this.totalPax,
      this.totalRooms,
      this.tripId,
      this.tripItineraryDetailId,
      this.tripType,
      this.uAPISessionId,
      this.voucherStatus,
      this.voucheredOn});

  factory ItemItinerary.fromJson(Map<String, dynamic> json) {
    return ItemItinerary(
      agencyId: json['AgencyId'] == null ? null : json['AgencyId'],
      sourceStatus: json['SourceStatus'] == null ? null : json['SourceStatus'],
      tboHotelCode: json['HotelCode'] == null ? null : json['TBOHotelCode'],
      agencyName: json['AgencyName'] == null ? null : json['AgencyName'],
      billedToClient:
          json['BilliedToClient'] == null ? null : json['BilliedToClient'],
      billingEntityId:
          json['BillingEntityId'] == null ? null : json['BillingEntityId'],
      bookedForm: json['BookedForm'] == null ? null : json['BillingEntityId'],
      bookingId: json['BookingId'] == null ? null : json['BookingId'],
      cancellationPolicies: json['CancellationPolicies'] == null
          ? null
          : List<CancellationPolicies>.from(json['CancellationPolicies']
              .map((x) => CancellationPolicies.fromJson(x))),
      changeRequestExists: json['ChangeRequestExists'] == null
          ? null
          : json['ChangeRequestExists'],
      checkInDate: json['CheckInDate'] == null
          ? null
          : DateTime.parse(json['CheckInDate']).toString(),
      checkOutDate: json['CheckOutDate'] == null
          ? null
          : DateTime.parse(json['CheckOutDate']).toString(),
      changeRequestStatus: json['ChangeRequestStatus'] == null
          ? null
          : json['ChangeRequestStatus'],
      cityId: json['CityId'] == null ? null : json['CityId'],
      cityName: json['CityName'] == null ? null : json['CityName'],
      companyCode: json['CompanyCode'] == null ? null : json['CompanyCode'],
      corporateId: json['CorporateId'] == null ? null : json['CorporateId'],
      costCenterId: json['CostCenterId'] == null ? null : json['CostCenterId'],
      country: json['Country'] == null ? null : json['Country'],
      countryCode: json['CountryCode'] == null ? null : json['CountryCode'],
      createdOn: json['CreatedOn'] == null
          ? null
          : DateTime.parse(json['CreatedOn']).toString(),
      hasChannelManagerSource: json['HasChannelManagerSource'] == null
          ? null
          : json['HasChannelManagerSource'],
      hotelId: json['HotelId'] == null ? null : json['HotelId'],
      hotelImage: json['HotelImage'] == null ? null : json['HotelImage'],
      hotelName: json['HotelName'] == null ? null : json['HotelName'],
      hotelNorms: json['HotelNorms'] == null ? null : json['HotelNorms'],
      hotelRating: json['HotelRating'] == null ? null : json['HotelRating'],
      inPolicy: json['InPolicy'] == null ? null : json['InPolicy'],
      invoice:
          json['Invoice'] == null ? null : Invoice.fromJson(json['Invoice']),
      isBooked: json['IsBooked'] == null ? null : json['IsBooked'],
      isDrafted: json['IsDrafted'] == null ? null : json['IsDrafted'],
      isGuestMailRequired: json['IsGuestMailRequired'] == null
          ? null
          : json['IsGuestMailRequired'],
      isImport: json['IsImport'] == null ? null : json['IsImport'],
      isManual: json['IsManual'] == null ? null : json['IsManual'],
      isPANRequiredForBooking: json['IsPANRequiredForBooking'] == null
          ? null
          : json['IsPANRequiredForBooking'],
      isPostPay: json['IsPostPay'] == null ? null : json['IsPostPay'],
      isSentForApprove:
          json['IsSentForApprove'] == null ? null : json['IsSentForApprove'],
      isfromQueue: json['IsFromQueue'] == null ? null : json['IsFromQueue'],
      lastCancellationDate: json['LastCancellationDate'] == null
          ? null
          : DateTime.parse(json['LastCancellationDate']).toString(),
      lastModifiedBy:
          json['LastModifiedBy'] == null ? null : json['LastModifiedBy'],
      lastModifiedOn: json['LastModifiedOn'] == null
          ? null
          : DateTime.parse(json['LastModifiedOn']).toString(),
      latitude: json['Latitude'] == null ? null : json['Latitude'],
      loggedInAgencyId:
          json['LoggedInAgencyId'] == null ? null : json['LoggedInAgencyId'],
      loggedInMemberId:
          json['LoggedInMemberId'] == null ? null : json['LoggedInMemberId'],
      longitude: json['Longitude'] == null ? null : json['Longitude'],
      memeberId: json['MemberId'] == null ? null : json['MemberId'],
      memeberName: json['MemberName'] == null ? null : json['MemberName'],
      nationality: json['Nationality'] == null ? null : json['Nationality'],
      parentBookingId:
          json['ParentBookingId'] == null ? null : json['ParentBookingId'],
      paymentGatewaySourceId: json['PaymentGatewaySourceId'] == null
          ? null
          : json['PaymentGatewaySourceId'],
      requestSentBookingId: json['RequestSentBookingId'] == null
          ? null
          : json['RequestSentBookingId'],
      requestType: json['RequestType'] == null ? null : json['RequestType'],
      rooms: json['Rooms'] == null
          ? null
          : List<Rooms>.from(json['Rooms'].map((x) => Rooms.fromJson(x))),
      sessionId: json['SessionId'] == null ? null : json['SessionId'],
      sourceId: json['SourceId'] == null ? null : json['SourceId'],
      sourceName: json['SourceName'] == null ? null : json['SourceName'],
      supplierBookingRefNo: json['SupplierBookingRefo'] == null
          ? null
          : json['SupplierBookingRefNo'],
      supplierConfirmationNo: json['SupplierConfirmationNo'] == null
          ? null
          : json['SupplierConfirmationNo'],
      supplierHotelCode:
          json['SupplierHotelCode'] == null ? null : json['SupplierHotelCode'],
      tboRefNo: json['TBORefNo'] == null ? null : json['TBORefNO'],
      totalPax: json['TotalPax'] == null ? null : json['TotalPax'],
      totalRooms: json['TotalRooms'] == null ? null : json['TotalRooms'],
      tripId: json['TripId'] == null ? null : json['TripId'],
      tripItineraryDetailId: json['TripItineraryDetailId'] == null
          ? null
          : json['TripItineraryDetailId'],
      tripType: json['TripType'] == null ? null : json['TripType'],
      uAPISessionId:
          json['UAPISessionId'] == null ? null : json['UAPISessionID'],
      voucherStatus:
          json['VoucherStatus'] == null ? null : json['VoucherStatus'],
      voucheredOn: json['VoucheredOn'] == null
          ? null
          : DateTime.parse(json['VoucheredOn']),
    );
  }

  Map<String, dynamic> toJson() => {
        'BookingId': bookingId == null ? null : bookingId,
        'CorporateId': corporateId == null ? null : corporateId,
        'ParentBookingId': parentBookingId == null ? null : parentBookingId,
        'HotelId': hotelId == null ? null : hotelId,
        'RequestSentBookingId':
            requestSentBookingId == null ? null : requestSentBookingId,
        'CompanyCode': companyCode == null ? null : companyCode,
        'SupplierConfirmationNo':
            supplierConfirmationNo == null ? null : supplierConfirmationNo,
        'SupplierBookingRefNo':
            supplierBookingRefNo == null ? null : supplierBookingRefNo,
        'TBORefNo': tboRefNo == null ? null : tboRefNo,
        'TripType': tripType == null ? null : tripType,
        'TripId': tripId == null ? null : tripId,
        'TripItineraryDetailId':
            tripItineraryDetailId == null ? null : tripItineraryDetailId,
        'CheckInDate': checkInDate == null ? null : checkInDate,
        'CheckOutDate': checkOutDate == null ? null : checkOutDate,
        'SourceId': sourceId == null ? null : sourceId,
        'SourceName': sourceName == null ? null : sourceName,
        'SourceStatus': sourceStatus == null ? null : sourceName,
        'VoucherStatus': voucherStatus == null ? null : voucherStatus,
        'VoucheredOn':
            voucheredOn == null ? null : voucheredOn!.toIso8601String(),
        'Nationality': nationality == null ? null : nationality,
        'TotalRooms': totalRooms == null ? null : totalRooms,
        'TotalPax': totalPax == null ? null : totalPax,
        'BookedForm': bookedForm == null ? null : bookedForm,
        'UAPISessionId': uAPISessionId == null ? null : uAPISessionId,
        'SessionId': sessionId == null ? null : sessionId,
        'LastCancellationDate':
            lastCancellationDate == null ? null : lastCancellationDate,
        'LastModifiedBy': lastModifiedBy == null ? null : lastModifiedBy,
        'CancellationPolicies': cancellationPolicies == null
            ? null
            : List<CancellationPolicies>.from(
                cancellationPolicies!.map((x) => x)),
        'Rooms': rooms == null ? null : List<Rooms>.from(rooms!.map((x) => x)),
        'RequestType': requestType == null ? null : requestType,
        'IsGuestMailRequired':
            isGuestMailRequired == null ? null : isGuestMailRequired,
        'IsPostPay': isPostPay == null ? null : isPostPay,
        'AgencyId': agencyId == null ? null : agencyId,
        'ÁgencyName': agencyName == null ? null : agencyName,
        'LoggedInAgencyId': loggedInAgencyId == null ? null : loggedInAgencyId,
        'LoggedInMemberId': loggedInMemberId == null ? null : loggedInMemberId,
        'IsBooked': isBooked == null ? null : isBooked,
        'IsDrafted': isDrafted == null ? null : isDrafted,
        'IsSentForApprove': isSentForApprove == null ? null : isSentForApprove,
        'IsFromQueue': isfromQueue == null ? null : isfromQueue,
        'TBoHotelCode': tboHotelCode == null ? null : tboHotelCode,
        'SupplierHotelCode':
            supplierHotelCode == null ? null : supplierHotelCode,
        'HotelName': hotelName == null ? null : hotelName,
        'HotelRating': hotelRating == null ? null : hotelRating,
        'HotelNorms': hotelNorms == null ? null : hotelNorms,
        'HotelImage': hotelImage == null ? null : hotelImage,
        'CityId': cityId == null ? null : cityId,
        'CityName': cityName == null ? null : cityName,
        'Country': country == null ? null : country,
        'CountryCode': countryCode == null ? null : countryCode,
        'Latitude': latitude == null ? null : latitude,
        'Longitude': longitude == null ? null : longitude,
        'CreatedOn': createdOn == null ? null : createdOn,
        'IsImport': isImport == null ? null : isImport,
        'IsManual': isManual == null ? null : isManual,
        'ChangeRequestExists':
            changeRequestExists == null ? null : changeRequestExists,
        'ChangeRequestStatus':
            changeRequestStatus == null ? null : changeRequestStatus,
        'PaymentGatewaySourceId':
            paymentGatewaySourceId == null ? null : paymentGatewaySourceId,
        'BillingEntityId': billingEntityId == null ? null : billingEntityId,
        'CostCenterId': costCenterId == null ? null : costCenterId,
        'BilledToClient': billedToClient == null ? null : billedToClient,
        'InPolicy': inPolicy == null ? null : inPolicy,
        'Invoice': invoice == null ? null : invoice,
        'IsPANRequiredForBooking':
            isPANRequiredForBooking == null ? null : isPANRequiredForBooking,
        'MemberName': memeberName == null ? null : memeberName,
        'MemberId': memeberId == null ? null : memeberId,
        'HasChannelManagerSource':
            hasChannelManagerSource == null ? null : hasChannelManagerSource,
        'LastModifiedOn': lastModifiedOn == null ? null : lastModifiedOn,
      };
}

class CancellationPolicies {
  int? hotelId;
  int? roomId;
  String? roomName;
  String? roomTypeCode;
  String? ratePlanCode;
  String? start;
  String? end;
  String? chargeType;
  double? chargeValue;
  String? currency;
  bool? isNoShowPolicy;
  String? policyType;

  CancellationPolicies(
      {this.chargeType,
      this.chargeValue,
      this.currency,
      this.end,
      this.hotelId,
      this.isNoShowPolicy,
      this.policyType,
      this.ratePlanCode,
      this.roomId,
      this.roomName,
      this.roomTypeCode,
      this.start});

  factory CancellationPolicies.fromJson(Map<String, dynamic> json) {
    return CancellationPolicies(
        ratePlanCode:
            json['RatePlanCode'] == null ? null : json['RatePlanCode'],
        chargeType: json['ChargeType'] == null ? null : json['ChargeType'],
        chargeValue: json['ChargeValue'] == null ? null : json['ChargeValue'],
        currency: json['Currency'] == null ? null : json['Currency'],
        end:
            json['End'] == null ? null : DateTime.parse(json['End']).toString(),
        hotelId: json['HotelId'] == null ? null : json['HotelId'],
        isNoShowPolicy:
            json['IsNoShowPolicy'] == null ? null : json['IsNoShowPolicy'],
        policyType: json['PolicyType'] == null ? null : json['PolicyType'],
        roomId: json['RoomId'] == null ? null : json['RoomId'],
        roomName: json['RoomName'] == null ? null : json['RoomName'],
        roomTypeCode:
            json['RoomTypeCode'] == null ? null : json['RoomTypeCode'],
        start: json['Start'] == null
            ? null
            : DateTime.parse(json['Start']).toString());
  }

  Map<String, dynamic> toJson() => {
        'HotelId': hotelId == null ? null : hotelId,
        'RoomId': roomId == null ? null : roomId,
        'RoomName': roomName == null ? null : roomName,
        'RoomTypeCode': roomTypeCode == null ? null : roomTypeCode,
        'RatePlanCode': ratePlanCode == null ? null : ratePlanCode,
        'Start': start == null ? null : start,
        'End': end == null ? null : end,
        'ChargeType': chargeType == null ? null : chargeType,
        'ChargeValue': chargeValue == null ? null : chargeValue,
        'IsNoShowPolicy': isNoShowPolicy == null ? null : isNoShowPolicy,
        'Currency': currency == null ? null : currency,
        'PolicyType': policyType == null ? null : policyType
      };
}

class Rooms {
  int? roomId;
  int? roomIndex;
  int? hotelId;
  String? roomTypeCode;
  String? ratePlanCode;
  String? roomName;
  String? mealPlan;
  List<String>? inclusions;
  bool? hideRateBreakUp;
  List<RateBreakUp>? rateBreakUp;
  Price? price;
  bool? isInstantConfirmed;
  int? adultCount;
  int? childCount;
  List<Passengers>? passengers;
  int? priceId;
  int? sequenceId;
  bool? canConfirmAtBook;
  bool? isFlightDetailsRequired;
  String? lastCancellationDate;
  bool? isCancelRefundable;
  bool? isPANRequired;
  bool? isPassportRequired;

  Rooms(
      {this.adultCount,
      this.canConfirmAtBook,
      this.childCount,
      this.hideRateBreakUp,
      this.hotelId,
      this.inclusions,
      this.isCancelRefundable,
      this.isFlightDetailsRequired,
      this.isInstantConfirmed,
      this.isPANRequired,
      this.isPassportRequired,
      this.lastCancellationDate,
      this.mealPlan,
      this.passengers,
      this.price,
      this.priceId,
      this.rateBreakUp,
      this.ratePlanCode,
      this.roomId,
      this.roomIndex,
      this.roomName,
      this.roomTypeCode,
      this.sequenceId});

  factory Rooms.fromJson(Map<String, dynamic> json) {
    return Rooms(
        adultCount: json['AdultCount'] == null ? null : json['AdultCount'],
        canConfirmAtBook:
            json['CanConfirmAtBook'] == null ? null : json['CanConfirmAtBook'],
        childCount: json['ChildCount'] == null ? null : json['ChildCount'],
        hideRateBreakUp:
            json['HideRateBreakUp'] == null ? null : json['HideRateBreakUp'],
        hotelId: json['HotelId'] == null ? null : json['HotelId'],
        inclusions: json['Inclusions'] == null
            ? null
            : List<String>.from(json['Inclusions'].map((x) => x)),
        isCancelRefundable: json['IsCancelRefundable'] == null
            ? null
            : json['IsCancelRefundable'],
        isFlightDetailsRequired: json['IsFlightDetailsRequired'] == null
            ? null
            : json['IsFlightDetailsRequired'],
        isInstantConfirmed: json['IsInstantConfirmed'] == null
            ? null
            : json['IsInstantConfirmed'],
        roomName: json['RoomName'] == null ? null : json['RoomName'],
        isPANRequired:
            json['IsPANRequired'] == null ? null : json['IsPANRequired'],
        sequenceId: json['SequenceId'] == null ? null : json['SequenceId'],
        isPassportRequired: json['IsPassportRequired'] == null
            ? null
            : json['IsPassportRequired'],
        lastCancellationDate: json['LastCancellationDate'] == null
            ? null
            : DateTime.parse(json['LastCancellationDate']).toString(),
        mealPlan: json['MealPlan'] == null ? null : json['MealPlan'],
        passengers: json['Passengers'] == null
            ? null
            : List<Passengers>.from(
                json['Passengers'].map((x) => Passengers.fromJson(x))),
        price: json['Price'] == null ? null : Price.fromJson(json['Price']),
        priceId: json['PriceId'] == null ? null : json['PriceId'],
        rateBreakUp: json['RateBreakUp'] == null
            ? null
            : List<RateBreakUp>.from(
                json['RateBreakUp'].map((x) => RateBreakUp.fromJson(x))),
        ratePlanCode:
            json['RatePlanCode'] == null ? null : json['RatePlanCode'],
        roomId: json['RoomId'] == null ? null : json['RoomId'],
        roomIndex: json['RoomIndex'] == null ? null : json['RoomIndex'],
        roomTypeCode:
            json['RoomTypeCode'] == null ? null : json['RoomTypeCode']);
  }

  Map<String, dynamic> toJson() => {
        'RoomId': roomId == null ? null : roomId,
        'RoomIndex': roomIndex == null ? null : roomIndex,
        'HotelId': hotelId == null ? null : hotelId,
        'RoomTypeCode': roomTypeCode == null ? null : roomTypeCode,
        'RatePlanCode': ratePlanCode == null ? null : ratePlanCode,
        'RoomName': roomName == null ? null : roomName,
        'MealPlan': mealPlan == null ? null : mealPlan,
        'Inclusions': inclusions == null
            ? null
            : List<String>.from(inclusions!.map((x) => x)),
        'HideRateBreakUp': hideRateBreakUp == null ? null : hideRateBreakUp,
        'RateBreakUp': rateBreakUp == null
            ? null
            : List<RateBreakUp>.from(rateBreakUp!.map((x) => x)),
        'Price': price == null ? null : price!.toJson(),
        'IsInstantConfirmed':
            isInstantConfirmed == null ? null : isInstantConfirmed,
        'AdultCount': adultCount == null ? null : adultCount,
        'ChildCount': childCount == null ? null : childCount,
        'Passengers': passengers == null
            ? null
            : List<Passengers>.from(passengers!.map((x) => x)),
        'PriceId': priceId == null ? null : priceId,
        'SequenceId': sequenceId == null ? null : sequenceId,
        'CanConfirmAtBook': canConfirmAtBook == null ? null : canConfirmAtBook,
        'IsFlightDetailsRequired':
            isFlightDetailsRequired == null ? null : isFlightDetailsRequired,
        'LastCancellationDate':
            lastCancellationDate == null ? null : lastCancellationDate,
        'IsCancelRefundable':
            isCancelRefundable == null ? null : isCancelRefundable,
        'IsPANRequired': isPANRequired == null ? null : isPANRequired,
        'IsPassportRequired':
            isPassportRequired == null ? null : isPassportRequired
      };
}

class RateBreakUp {
  int? roomId;
  String? date;
  double? basePrice;
  double? tax;
  double? total;

  RateBreakUp({this.roomId, this.basePrice, this.date, this.tax, this.total});

  factory RateBreakUp.fromJson(Map<String, dynamic> json) {
    return RateBreakUp(
        roomId: json['RoomId'] == null ? null : json['RoomId'],
        date: json['Date'] == null
            ? null
            : DateTime.parse(json['Date']).toString(),
        basePrice: json['BasePrice'] == null ? null : json['BasePrice'],
        tax: json['Tax'] == null ? null : json['Tax'],
        total: json['Total'] == null ? null : json['Total']);
  }

  Map<String, dynamic> toJson() => {
        'RoomId': roomId == null ? null : roomId,
        'Date': date == null ? null : date,
        'BasePrice': basePrice == null ? null : basePrice,
        'Tax': tax == null ? null : tax,
        'Total': total == null ? null : total
      };
}

class Price {
  String? currency;
  String? supplierCurrency;
  double? totalFare;
  String? corporateCurrency;
  String? agentCurrency;
  double? corpROE;
  double? agentROE;
  double? preferredROE;
  double? baseFare;
  double? tax;
  double? otherCharges;
  double? serviceFee;
  double? reIssueCharges;
  double? airlineSeatCharges;
  double? airlineSpecialServiceCharges;
  double? airlineBaggageCharges;
  double? recommendedFare;
  double? agentMarkup;
  double? totalPrice;
  double? offeredFare;
  String? serviceFeeType;
  double? serviceFeeAmount;
  double? originalAgentMarkup;
  double? additionalAgentMarkUp;

  Price(
      {this.additionalAgentMarkUp,
      this.agentCurrency,
      this.agentMarkup,
      this.agentROE,
      this.airlineBaggageCharges,
      this.airlineSeatCharges,
      this.airlineSpecialServiceCharges,
      this.baseFare,
      this.corpROE,
      this.corporateCurrency,
      this.currency,
      this.offeredFare,
      this.originalAgentMarkup,
      this.otherCharges,
      this.preferredROE,
      this.reIssueCharges,
      this.recommendedFare,
      this.serviceFee,
      this.serviceFeeAmount,
      this.serviceFeeType,
      this.supplierCurrency,
      this.tax,
      this.totalFare,
      this.totalPrice});

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      additionalAgentMarkUp: json['AdditionalAgentMarkUp'] == null
          ? null
          : json['AdditionalAgentMarkUp'],
      agentCurrency:
          json['AgentCurrency'] == null ? null : json['AgentCurrency'],
      agentMarkup: json['AgentMarkUp'] == null ? null : json['AgentMarkUp'],
      agentROE: json['AgentROE'] == null ? null : json['AgentROE'],
      airlineBaggageCharges: json['AirlineBaggageCharges'] == null
          ? null
          : json['AirlineBaggageCharges'],
      airlineSeatCharges: json['AirlineSeatCharges'] == null
          ? null
          : json['AirlineSeatCharges'],
      airlineSpecialServiceCharges: json['AirlineSpecialServiceCharges'] == null
          ? null
          : json['AirlineSpecialServiceCharges'],
      baseFare: json['BaseFare'] == null ? null : json['BaseFare'],
      corpROE: json['CorpROE'] == null ? null : json['CorpROE'],
      corporateCurrency:
          json['CorporateCurrency'] == null ? null : json['CorporateCurrency'],
      currency: json['Currency'] == null ? null : json['Currency'],
      offeredFare: json['OfferedFare'] == null ? null : json['OfferedFare'],
      originalAgentMarkup: json['OriginalAgentMarkUp'] == null
          ? null
          : json['OriginalAgentMarkUp'],
      otherCharges: json['OtherCharges'] == null ? null : json['OtherCharges'],
      preferredROE: json['PreferredROE'] == null ? null : json['PreferredROE'],
      reIssueCharges:
          json['reIssueCharges'] == null ? null : json['reIssueCharges'],
      recommendedFare:
          json['RecommendedFare'] == null ? null : json['RecommendedFare'],
      serviceFee: json['ServiceFee'] == null ? null : json['ServiceFee'],
      serviceFeeAmount:
          json['ServiceAmount'] == null ? null : json['ServiceAmount'],
      serviceFeeType:
          json['ServiceFeeType'] == null ? null : json['ServiceFeeType'],
      supplierCurrency:
          json['SupplierCurrency'] == null ? null : json['SupplierCurrency'],
      tax: json['Tax'] == null ? null : json['Tax'],
      totalFare: json['TotalFare'] == null ? null : json['TotalFare'],
      totalPrice: json['TotalPrice'] == null ? null : json['TotalPrice'],
    );
  }

  Map<String, dynamic> toJson() => {
        'Currency': currency == null ? null : currency,
        'SupplierCurrency': supplierCurrency == null ? null : supplierCurrency,
        'TotalFare': totalFare == null ? null : totalFare,
        'CorporateCurrency':
            corporateCurrency == null ? null : corporateCurrency,
        'AgentCurrency': agentCurrency == null ? null : agentCurrency,
        'CorpROE': corpROE == null ? null : corpROE,
        'AgentROE': agentROE == null ? null : agentROE,
        'PreferredROE': preferredROE == null ? null : preferredROE,
        'BaseFare': baseFare == null ? null : baseFare,
        'Tax': tax == null ? null : tax,
        'OtherCharges': otherCharges == null ? null : otherCharges,
        'ServiceFee': serviceFee == null ? null : serviceFee,
        'ReIssueCharges': reIssueCharges == null ? null : reIssueCharges,
        'AirlineSeatCharges':
            airlineSeatCharges == null ? null : airlineSeatCharges,
        'AirlineSpecialServiceCharges': airlineSpecialServiceCharges == null
            ? null
            : airlineSpecialServiceCharges,
        'AirlineBaggageCharges':
            airlineBaggageCharges == null ? null : airlineBaggageCharges,
        'RecommendedFare': recommendedFare == null ? null : recommendedFare,
        'AgentMarkup': agentMarkup == null ? null : agentMarkup,
        'TotalPrice': totalPrice == null ? null : totalPrice,
        'OfferedFare': offeredFare == null ? null : offeredFare,
        'ServiceFeeType': serviceFeeType == null ? null : serviceFeeType,
        'ServiceFeeAmount': serviceFeeAmount == null ? null : serviceFeeAmount,
        'OriginalAgentMarkup':
            originalAgentMarkup == null ? null : originalAgentMarkup,
        'AdditionalAgentMarkUp':
            additionalAgentMarkUp == null ? null : additionalAgentMarkUp
      };
}

class Passengers {
  int? paxId;
  int? paxUserId;
  int? hotelId;
  int? roomId;
  String? paxType;
  String? paxTitle;
  String? firstName;
  String? lastName;
  String? fullName;
  bool? isLeadPax;
  String? email;
  int? age;
  String? countryCode;

  Passengers(
      {this.age,
      this.countryCode,
      this.email,
      this.firstName,
      this.fullName,
      this.hotelId,
      this.isLeadPax,
      this.lastName,
      this.paxId,
      this.paxTitle,
      this.paxType,
      this.paxUserId,
      this.roomId});

  factory Passengers.fromJson(Map<String, dynamic> json) {
    return Passengers(
      age: json['Age'] == null ? null : json['Age'],
      countryCode: json['CountryCode'] == null ? null : json['CountryCode'],
      email: json['Email'] == null ? null : json['Email'],
      firstName: json['FirstName'] == null ? null : json['FirstName'],
      lastName: json['LastName'] == null ? null : json['LastName'],
      fullName: json['FullName'] == null ? null : json['FullName'],
      hotelId: json['HotelId'] == null ? null : json['HotelId'],
      isLeadPax: json['IsLeadPax'] == null ? null : json['IsLeadPax'],
      paxId: json['PaxId'] == null ? null : json['PaxId'],
      paxTitle: json['PaxTitle'] == null ? null : json['PaxTitle'],
      paxType: json['PaxType'] == null ? null : json['PaxType'],
      paxUserId: json['PaxUserId'] == null ? null : json['PaxUserId'],
      roomId: json['RoomId'] == null ? null : json['RoomId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'PaxId': paxId == null ? null : paxId,
        'PaxUserId': paxUserId == null ? null : paxUserId,
        'HotelId': hotelId == null ? null : hotelId,
        'RoomId': roomId == null ? null : roomId,
        'PaxType': paxType == null ? null : paxType,
        'PaxTitle': paxTitle == null ? null : paxTitle,
        'FirstName': firstName == null ? null : firstName,
        'LastName': lastName == null ? null : lastName,
        'FullName': fullName == null ? null : fullName,
        'IsLeadPax': isLeadPax == null ? null : isLeadPax,
        'Email': email == null ? null : email,
        'Age': age == null ? null : age,
        'CountryCode': countryCode == null ? null : countryCode
      };
}

class Invoice {
  int? inVoiceNumber;
  int? bookingId;
  String? leadPaxName;
  String? itinerary;
  double? totalPrice;
  String? docTypeCode;
  int? documentNo;
  int? agencyId;
  String? status;
  String? paymentMode;
  List<LineItem>? lineItem;
  String? remarks;
  int? createdBy;
  String? createdOn;
  int? lastModifiedBy;
  String? lastModifiedOn;
  String? invoiceDueDate;
  bool? manuallyUpdated;
  int? corporateId;
  String? completeInVoiceNo;
  double? amount;
  bool? isCreditNode;
  String? itemType;

  Invoice(
      {this.agencyId,
      this.amount,
      this.bookingId,
      this.completeInVoiceNo,
      this.corporateId,
      this.createdBy,
      this.createdOn,
      this.docTypeCode,
      this.documentNo,
      this.inVoiceNumber,
      this.invoiceDueDate,
      this.isCreditNode,
      this.itemType,
      this.itinerary,
      this.lastModifiedBy,
      this.lastModifiedOn,
      this.leadPaxName,
      this.lineItem,
      this.manuallyUpdated,
      this.paymentMode,
      this.remarks,
      this.status,
      this.totalPrice});

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      agencyId: json['AgencyId'] == null ? null : json['AgencyId'],
      amount: json['Amount'] == null ? null : json['Amount'],
      bookingId: json['BookingId'] == null ? null : json['BookingId'],
      completeInVoiceNo: json['CompleteInVoiceNumber'] == null
          ? null
          : json['CompleteInVoiceNumber'],
      corporateId: json['CorporateId'] == null ? null : json['CorporateId'],
      createdBy: json['CreatedBy'] == null ? null : json['CreatedBy'],
      createdOn: json['CreatedOn'] == null ? null : json['CreatedOn'],
      docTypeCode: json['DocTypeCode'] == null ? null : json['DocTYpeCode'],
      documentNo:
          json['DocumentNumber'] == null ? null : json['DocumentNumber'],
      inVoiceNumber:
          json['InVoiceNumber'] == null ? null : json['InVoiceNumber'],
      invoiceDueDate:
          json['InVoiceDueDate'] == null ? null : json['InVoiceDueDate'],
      isCreditNode:
          json['IsCreatedNode'] == null ? null : json['IsCreatedNode'],
      itemType: json['ItemType'] == null ? null : json['ItemType'],
      itinerary: json['Itinerary'] == null ? null : json['Itinerary'],
      lastModifiedBy:
          json['LastModifiedBy'] == null ? null : json['LastModifiedBy'],
      lastModifiedOn:
          json['LastModifiedOn'] == null ? null : json['LastModifiedOn'],
      leadPaxName: json['LeadPaxName'] == null ? null : json['LeadPaxName'],
      lineItem: json['LineItem'] == null
          ? null
          : List<LineItem>.from(
              json['LineItem'].map((x) => LineItem.fromJson(x))),
      manuallyUpdated:
          json['ManuallyUpdated'] == null ? null : json['ManuallyUpdated'],
      paymentMode: json['PaymentMode'] == null ? null : json['PaymentMode'],
      remarks: json['Remarks'] == null ? null : json['Remarks'],
      status: json['Status'] == null ? null : json['Status'],
      totalPrice: json['TotalPrice'] == null ? null : json['TotalPrice'],
    );
  }

  Map<String, dynamic> toJson() => {
        'InVoiceNumber': inVoiceNumber == null ? null : inVoiceNumber,
        'BookingId': bookingId == null ? null : bookingId,
        'LeadPaxName': leadPaxName == null ? null : leadPaxName,
        'Itinerary': itinerary == null ? null : itinerary,
        'TotalPrice': totalPrice == null ? null : totalPrice,
        'DocTypeCode': docTypeCode == null ? null : docTypeCode,
        'DocumentNumber': documentNo == null ? null : documentNo,
        'AgencyId': agencyId == null ? null : agencyId,
        'Status': status == null ? null : status,
        'PaymentMode': paymentMode == null ? null : paymentMode,
        'LineItem': lineItem == null ? null : lineItem,
        'Remarks': remarks == null ? null : remarks,
        'CreatedBy': createdBy == null ? null : createdBy,
        'CreatedOn': createdOn == null ? null : createdOn,
        'LastModifiedBy': lastModifiedBy == null ? null : lastModifiedBy,
        'LastModifiedOn': lastModifiedOn == null ? null : lastModifiedOn,
        'InvoiceDueDate': invoiceDueDate == null ? null : invoiceDueDate,
        'ManuallyUpdated': manuallyUpdated == null ? null : manuallyUpdated,
        'CorporateId': corporateId == null ? null : corporateId,
        'CompleteInVoiceNumber':
            completeInVoiceNo == null ? null : completeInVoiceNo,
        'Amount': amount == null ? null : amount,
        'IsCreditNode': isCreditNode == null ? null : isCreditNode,
        'ItemType': itemType == null ? null : itemType,
      };
}

class LineItem {
  int? invoiceNo;
  int? itemReferenceId;
  List<String>? itemDescription;
  bool? isCreditNode;
  String? itemType;
  int? priceId;
  int? createdBy;
  bool? isCreditNote;

  LineItem(
      {this.createdBy,
      this.invoiceNo,
      this.isCreditNode,
      this.isCreditNote,
      this.itemDescription,
      this.itemReferenceId,
      this.itemType,
      this.priceId});

  factory LineItem.fromJson(Map<String, dynamic> json) {
    return LineItem(
      createdBy: json['CreatedBy'] == null ? null : json['CreatedBy'],
      invoiceNo: json['InVoiceNumber'] == null ? null : json['InVoiceNumber'],
      isCreditNode: json['IsCreditNode'] == null ? null : json['IsCreditNode'],
      isCreditNote: json['IsCreditNote'] == null ? null : json['IsCreditNote'],
      itemDescription: json['ItemDescription'] == null
          ? null
          : List<String>.from(json['ItemDescription'].map((x) => x)),
      itemReferenceId:
          json['ItemReferenceId'] == null ? null : json['ItemReferenceId'],
      itemType: json['ItemType'] == null ? null : json['ItemType'],
      priceId: json['PriceId'] == null ? null : json['PriceId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'InvoiceNumber': invoiceNo == null ? null : invoiceNo,
        'ItemReferenceId': itemReferenceId == null ? null : itemReferenceId,
        'ItemDescription': itemDescription == null
            ? null
            : List<String>.from(itemDescription!.map((x) => x)),
        'IsCreditNode': isCreditNode == null ? null : isCreditNode,
        'ItemType': itemType == null ? null : itemType,
        'PriceId': priceId == null ? null : priceId,
        'CreatedBy': createdBy == null ? null : createdBy,
        'IsCreditNote': isCreditNote == null ? null : isCreditNote
      };
}

class PolicyViolation {
  double? hotelBudget;
  int? advanceBookingDays;
  int? maxRating;

  PolicyViolation({this.advanceBookingDays, this.hotelBudget, this.maxRating});

  factory PolicyViolation.fromJson(Map<String, dynamic> json) {
    return PolicyViolation(
        advanceBookingDays: json['AdvanceBookingDays'] == null
            ? null
            : json['AdvanceBookingDays'],
        hotelBudget: json['HotelBudget'] == null ? null : json['HotelBudget'],
        maxRating: json['MaxRating'] == null ? null : json['MaxRating']);
  }

  Map<String, dynamic> toJson() => {
        'HotelBudget': hotelBudget == null ? null : hotelBudget,
        'AdvanceBookingDays':
            advanceBookingDays == null ? null : advanceBookingDays,
        'MaxRating': maxRating == null ? null : maxRating
      };
}

class TripBillingDetails {
  int? tripBillingDetailId;
  int? tripId;
  int? entityId;
  String? entityName;
  int? costCenterId;
  String? costCenterName;
  int? reasonOfTravelId;
  String? reasonOfTravel;
  bool? isBillToClient;
  String? clientName;
  bool? isOutOfPolicy;
  String? outOfPolicyReasons;
  List<int>? approvers;
  String? travellerRemarks;
  int? requestedBy;
  String? requesterName;
  String? requestedOn;
  String? approverRemarks;
  int? approvedBy;
  String? approverName;
  String? approvedOn;

  TripBillingDetails(
      {this.approvedBy,
      this.approvedOn,
      this.approverName,
      this.approverRemarks,
      this.approvers,
      this.clientName,
      this.costCenterId,
      this.costCenterName,
      this.entityId,
      this.entityName,
      this.isBillToClient,
      this.isOutOfPolicy,
      this.outOfPolicyReasons,
      this.reasonOfTravel,
      this.reasonOfTravelId,
      this.requestedBy,
      this.requestedOn,
      this.requesterName,
      this.travellerRemarks,
      this.tripBillingDetailId,
      this.tripId});

  factory TripBillingDetails.fromJson(Map<String, dynamic> json) {
    return TripBillingDetails(
      approvedBy: json['ApprovedBy'] == null ? null : json['ApprovedBy'],
      approvedOn: json['ApprovedOn'] == null
          ? null
          : DateTime.parse(json['ApprovedOn']).toString(),
      approverName: json['ApproverName'] == null ? null : json['ApproverName'],
      approverRemarks:
          json['ApproverRemarks'] == null ? null : json['ApproverRemarks'],
      approvers: json['Approvers'] == null
          ? null
          : List<int>.from(json['Approvers'].map((x) => x)),
      clientName: json['ClientName'] == null ? null : json['ClientName'],
      costCenterId: json['CostCenterId'] == null ? null : json['CostCenterId'],
      costCenterName:
          json['CostCenterName'] == null ? null : json['CostCenterName'],
      entityId: json['EntityId'] == null ? null : json['EntityId'],
      entityName: json['EntityName'] == null ? null : json['EntityName'],
      isBillToClient:
          json['IsBillToClient'] == null ? null : json['IsBillToClient'],
      isOutOfPolicy:
          json['IsOutOfPolicy'] == null ? null : json['IsOutOfPolicy'],
      outOfPolicyReasons: json['OutOfPolicyReasons'] == null
          ? null
          : json['OutOfPolicyReasons'],
      reasonOfTravel:
          json['ReasonOfTravel'] == null ? null : json['ReasonOfTravel'],
      reasonOfTravelId:
          json['ReasonOfTravelId'] == null ? null : json['ReasonOfTravelId'],
      requestedBy: json['RequestedBy'] == null ? null : json['RequestedBy'],
      requestedOn: json['RequestedOn'] == null
          ? null
          : DateTime.parse(json['RequestedOn']).toString(),
      requesterName:
          json['RequesterName'] == null ? null : json['RequesterName'],
      travellerRemarks:
          json['TravellerRemarks'] == null ? null : json['TravellerRemarks'],
      tripBillingDetailId: json['TripBillingDetailId'] == null
          ? null
          : json['TripBillingDetailId'],
      tripId: json['TripId'] == null ? null : json['TripId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'TripBillingDetailId':
            tripBillingDetailId == null ? null : tripBillingDetailId,
        'TripId': tripId == null ? null : tripId,
        'EntityId': entityId == null ? null : entityId,
        'EntityName': entityName == null ? null : entityName,
        'CostCenterId': costCenterId == null ? null : costCenterId,
        'CostCenterName': costCenterName == null ? null : costCenterId,
        'ReasonOfTravelId': reasonOfTravelId == null ? null : reasonOfTravelId,
        'ReasonOfTravel': reasonOfTravel == null ? null : reasonOfTravel,
        'IsBillToClient': isBillToClient == null ? null : isBillToClient,
        'ClientName': clientName == null ? null : clientName,
        'IsOutOfPolicy': isOutOfPolicy == null ? null : isOutOfPolicy,
        'OutOfPolicyReasons':
            outOfPolicyReasons == null ? null : outOfPolicyReasons,
        'Approvers':
            approvers == null ? null : List<int>.from(approvers!.map((x) => x)),
        'TravellerRemarks': travellerRemarks == null ? null : travellerRemarks,
        'RequestedBy': requestedBy == null ? null : requestedBy,
        'RequesterName': requesterName == null ? null : requesterName,
        'RequestedOn': requestedOn == null ? null : requestedOn,
        'ApproverRemarks': approverRemarks == null ? null : approverRemarks,
        'ApprovedBy': approvedBy == null ? null : approvedBy,
        'ApproverName': approverName == null ? null : approverName,
        'ApprovedOn': approvedOn == null ? null : approvedOn
      };
}
