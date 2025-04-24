import 'package:dio/dio.dart';

import '../utility/utilities.dart';
import 'dio_exception.dart';
import 'navigation_service.dart';

class ApiService {
  ApiService._();

  /// Singleton instance of Dio
  static final _dio = Dio();

  /// GET service method to fetch data from the API
  ///
  /// [url] is the endpoint to fetch data from
  ///
  /// Returns a [Response] object if the request is successful, otherwise returns null
  ///
  /// Handles Dio exceptions and shows a custom SnackBar for errors
  static Future<Response?> getService({required String url}) async {
    try {
      return await _dio.get(url);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      Utilities.customSnackBar(
        context: NavigationService.navigatorKey.currentContext!,
        content: errorMessage,
        isSucess: false,
      );
      return null;
    }
  }

  /// POST service method to send data to the API
  ///
  /// [url] is the endpoint to send data to
  ///
  /// [data] is the data to be sent in the request body
  ///
  /// [isFormData] indicates whether the data is in form-data format
  ///
  /// Returns a [Response] object if the request is successful, otherwise returns null
  ///
  /// Handles Dio exceptions and shows a custom SnackBar for errors

  Future<Response?> postService({
    required String url,
    required Object? data,
    bool? isFormData,
  }) async {
    try {
      return await _dio.post(
        url,
        data: data,
        options: Options(
          contentType:
              (isFormData != null && isFormData)
                  ? 'multipart/form-data; boundary=----WebKitFormBoundaryk8IcQm1c1MfVTWAN'
                  : null,
          // headers: headers,
        ),
      );
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      Utilities.customSnackBar(
        context: NavigationService.navigatorKey.currentContext!,
        content: errorMessage,
        isSucess: false,
      );
      return null;
    }
  }
}
