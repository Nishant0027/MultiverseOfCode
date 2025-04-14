import '../../../config/environment_config.dart';

class ApiConstants {
  ApiConstants._();

  /// Api version
  static const String apiVersion = "1.0";

  /// Service Calls Related Base URLs
  static const String serviceDevBaseUrl =
      "https://dev-1tfmv2-services.1rivet.com/";
  static const String serviceQaBaseUrl =
      "https://qa-1tfmv2-services.1rivet.com/";
  static const String serviceProdBaseUrl =
      "https://1tfmv2-services.1rivet.com/";

  static const String clientEndpoint = "api/users/information";

  /// Reserve Space Api Endpoints
  /// This week get reserve space API
  static const String getReserveSpaceEndPoint = 'api/hotelling/getReserveSpace';

  ///My Preferrences Api Endpoints

  static const String getPreferredOffice = 'api/clients/';
  static const String getPreferredFloor = 'api/offices/';
  static const String officeEndpoint = "1";
  static final String floorPdfPrefix =
      "${AppEnvironment.serviceBaseUrl}Files/FloorPlan/";
  static final String documentPrefix =
      "${AppEnvironment.serviceBaseUrl}Files/Document/";
  static final String folderDocumentfPrefix =
      "${AppEnvironment.serviceBaseUrl}Files/FolderDocument/";
  static final String requestImagePrefix =
      "${AppEnvironment.serviceBaseUrl}Files/RequestImage/";
  static final String responseImagePrefix =
      "${AppEnvironment.serviceBaseUrl}Files/ResponseImage/";
  static const String addReserveSpaceEndPoint = 'api/hotelling/reserveSpace';
  static const String addNewVisitor = 'api/visitors';

  /// Favorites API endpoints
  static const String favoritesEndpoint = 'api/hotelling/reserveSpace/favorite';
  static const String favoriteCheckAvailabilityEndPoint =
      'api/hotelling/reserveSpace/favorite/findDeskAvailability';

  /// Home Page APIs
  static const String todayReservationEndpoint =
      "api/hotelling/reserveSpace/today";

  /// New Service Request Api
  static const String priorityEndpoint = "api/priorities";
  static const String addNewRequestEndpoint = "api/requests";
  static const String fetchRequestStatusEndpoint = "api/requests/statuses";
  static const String fetchServiceRequest = "api/requests/retrieve";

  /// Notification Api
  static const String deviceRegistration = "api/requests/registerDevice";
  static const String deleteDevice = "api/requests/deleteDevice";
}
