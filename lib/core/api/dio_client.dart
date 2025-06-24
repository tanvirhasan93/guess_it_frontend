import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  static Dio getDio() {
    var dio = Dio();
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        compact: false,
        requestBody: true,
        error: true,
        request: true,
      ),
    );
    return dio;
  }
}
