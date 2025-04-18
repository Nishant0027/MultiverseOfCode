class ApiQueries {
  ApiQueries._();

  /// Swagger Contractor Link: https://mcuapi.herokuapp.com/docs/#/
  static String moviesListQuery() => "movies";

  /// Swagger Contractor Link: https://mcuapi.herokuapp.com/docs/#/
  static String moviesDetailsQueryWithId({required int id}) => "movies/$id";

  /// Swagger Contractor Link: https://mcuapi.herokuapp.com/docs/#/
  static String tvShowsListQuery() => "tvshows?order=release_date%2CASC";

  /// Swagger Contractor Link: https://mcuapi.herokuapp.com/docs/#/
  static String tvShowsDetailsQueryWithId({required int id}) => "tvshows/$id";
}
