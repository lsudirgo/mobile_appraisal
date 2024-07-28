import 'package:dio/dio.dart';
import 'package:mobile_appraisal/core/config.dart';
import 'package:mobile_appraisal/data/datasources/auth/auth_interceptor_token.dart';

class DioClient {
  static final DioClient _singleton = DioClient._internal();
  late final Dio dio;

  factory DioClient() {
    return _singleton;
  }

  DioClient._internal() {
    final options = BaseOptions(
      connectTimeout: Duration(seconds: AppConfig.timeOut),
      receiveTimeout: Duration(seconds: AppConfig.receivetimeOut),
    );

    dio = Dio(options);
    dio.interceptors.add(TokenInterceptor(dio));
    // Tambahkan konfigurasi Dio lainnya jika diperlukan
  }
}
