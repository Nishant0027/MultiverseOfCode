class ApiQueries {
  static String floorPlanQuery({
    required int officeId,
    required int pageNumber,
    required int perPageCount,
  }) {
    return "api/offices/$officeId/floorPlan?page=$pageNumber&perPage=$perPageCount";
  }

  static String allAmenititesQuery({
    required int pageNumber,
    required int perPageCount,
  }) {
    return "api/hotelling/amenitiesPreference?page=$pageNumber&perPage=$perPageCount";
  }

  static String deleteReserveSpaceQuery({required int reserveSpaceId}) {
    return "api/hotelling/reserveSpace/$reserveSpaceId";
  }

  static String preferredOfficeQuery({
    required int clientId,
    required int pageNumber,
    required int perPages,
  }) {
    return "api/clients/$clientId/officeDetails?page=$pageNumber&perPage=$perPages";
  }

  static String preferredFloorQuery({
    required int officeId,
    required int pageNumber,
    required int perPages,
  }) {
    return "api/offices/$officeId/floorDetails?page=$pageNumber&perPage=$perPages";
  }

  static String selectedSpaceQuery({
    required int pageNumber,
    required int perPages,
  }) {
    return "api/hotelling/reserveSpace/findDeskAvailability?page=$pageNumber&perPage=$perPages";
  }

  static String reserveSpaceQuery({
    required int pageNumber,
    required int perPages,
  }) {
    return "api/hotelling/getReserveSpace?page=$pageNumber&perPage=$perPages";
  }

  static String searchSelectedSpaceQuery({
    required int pageNumber,
    required int perPages,
    required String query,
  }) {
    return "api/hotelling/desk/search?page=$pageNumber&perPage=$perPages&q=$query";
  }

  static String searchFavoriteDeskQuery({
    required int pageNumber,
    required int perPages,
    required String query,
  }) {
    return "api/hotelling/reserveSpace/favorite/search?page=$pageNumber&perPage=$perPages&q=$query";
  }

  static String upcomingWeekReserveSpaceQuery({
    required int pageNumber,
    required int perPages,
  }) {
    return "api/hotelling/getReserveSpaceForFuture?page=$pageNumber&perPage=$perPages";
  }

  static String quickLinksQuery({required int clientId}) {
    return "api/clients/$clientId/getQuickLinks/";
  }

  static String todaysVisitorQuery({required int userId}) {
    return "api/visitors/getTodaysVisitors/$userId";
  }

  static String thisWeekVisitorQuery({
    required int userId,
    required String? weekStartDate,
    required String? weekEndDate,
  }) {
    return "api/visitors/getThisWeekVisitors/$userId/$weekStartDate/$weekEndDate";
  }

  static String futureVisitorsQuery({
    required int userId,
    required String? checkInDateTime,
  }) {
    return "api/visitors/getFutureVisitors/$userId/$checkInDateTime";
  }

  static String deleteVisitor({required int visitorId}) =>
      "api/visitors/$visitorId";

  static String todaysActivityFeedQuery({
    required int pageNumber,
    required int perPages,
  }) {
    return "api/requests/activityFeed/today?page=$pageNumber&perPage=$perPages";
  }

  static String olderActivityFeedQuery({
    required int pageNumber,
    required int perPages,
    required String date,
  }) {
    return "api/requests/activityFeed/older?page=$pageNumber&perPage=$perPages&date=$date";
  }
}
