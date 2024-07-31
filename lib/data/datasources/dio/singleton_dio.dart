import 'package:dio/dio.dart';
import 'package:mobile_appraisal/core/config.dart';
import 'package:mobile_appraisal/data/datasources/dio/auth_interceptor_token.dart';

class DioClient {
  static final DioClient _singleton = DioClient._internal();

  factory DioClient() {
    return _singleton;
  }

  DioClient._internal();

  Dio dio() {
    var dio = Dio(
      BaseOptions(
        connectTimeout: Duration(seconds: AppConfig.timeOut),
        receiveTimeout: Duration(seconds: AppConfig.receivetimeOut),
        baseUrl: AppConfig.baseUrlapi,
      ),
    );

    // dio.interceptors.add(
    //   LogInterceptor(
    //     request: true,
    //     error: true,
    //     requestHeader: true,
    //     requestBody: true,
    //   ),
    // );
    dio.interceptors.add(
      TokenInterceptor(),
    );

    // Tambahkan konfigurasi Dio lainnya jika diperlukan
    return dio;
  }
}
