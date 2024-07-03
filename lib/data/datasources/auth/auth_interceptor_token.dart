import 'package:dio/dio.dart';
import 'package:mobile_appraisal/core/navigation_service.dart';
import 'package:mobile_appraisal/data/datasources/auth/auth_local_datasource.dart';

class TokenInterceptor extends Interceptor {
  Dio dio;

  TokenInterceptor(this.dio);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Cek apakah token ada dan belum expired
    final authData = await AuthLocalDatasource().getAuthData();
    final DateTime? expiresAt = authData?.result!.expiresAt;
    final String token = authData?.result?.accessToken ?? '';
    if (token != '' && !await isTokenExpired(expiresAt!)) {
      options.headers["Authorization"] = "Bearer $token";
    }
    return handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
      // Token expired, lakukan refresh token
      try {
        String refreshToken = await getRefreshToken();
        Response response = await dio
            .post('/refresh-token', data: {'refreshToken': refreshToken});
        if (response.statusCode == 200) {
          String newToken = response.data['token'];
          await saveToken(newToken);

          // Retry original request with new token
          err.requestOptions.headers["Authorization"] = "Bearer $newToken";
          final opts = Options(method: err.requestOptions.method);
          await dio.request(err.requestOptions.path,
              options: opts,
              data: err.requestOptions.data,
              queryParameters: err.requestOptions.queryParameters);

          // Ketika permintaan berhasil, tidak perlu mengembalikan respons apa pun
          return;
        }
      } catch (e) {
        // Refresh token gagal, arahkan user untuk login kembali
        redirectToLogin();
      }
    }
    return Future.error(err);
  }
}

Future<bool> isTokenExpired(DateTime expiresAt) async {
  final DateTime now = DateTime.now();

  return now.isAfter(expiresAt);
}

Future<String> getRefreshToken() async {
  // Implementasi untuk mendapatkan refresh token dari penyimpanan lokal
  return 'refreshToken';
}

Future<void> saveToken(String token) async {
  // Implementasi untuk menyimpan token baru ke penyimpanan lokal
}
