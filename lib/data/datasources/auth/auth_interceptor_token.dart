import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobile_appraisal/core/core.dart';
import 'package:mobile_appraisal/core/navigation_service.dart';
import 'package:mobile_appraisal/data/datasources/auth/auth_local_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    print(err);
    if (err.response?.statusCode == 401 ||
        err.response?.statusCode == 403 ||
        err.response?.statusCode == 400) {
      // Token expired, lakukan refresh token
      try {
        String refreshToken = await getRefreshToken();
        Response response = await dio.post(
          AppConfig.refreshToken,
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
              "Authorization": "Bearer $refreshToken"
            },
          ),
        );
        if (response.statusCode == 200) {
          Map<String, dynamic>? newToken = response.data['result'];
          print(response.data);
          await saveToken(newToken!);

          // Retry original request with new token
          final options = Options(
            method: err.requestOptions.method,
            headers: {
              ...err.requestOptions.headers,
              "Authorization": "Bearer ${newToken['accessToken']}",
            },
          );

          final retryResponse = await dio.request(
            err.requestOptions.path,
            options: options,
            data: err.requestOptions.data,
            queryParameters: err.requestOptions.queryParameters,
          );

          // Resolve handler with retryResponse
          return handler.resolve(retryResponse);
        }
      } catch (e) {
        // Refresh token gagal, arahkan user untuk login kembali
        redirectToLogin();
      }
    }
    return handler.next(err);
  }
}

Future<bool> isTokenExpired(DateTime expiresAt) async {
  final DateTime now = DateTime.now();

  return now.isAfter(expiresAt);
}

Future<String> getRefreshToken() async {
  // Ambil refresh token dari local storage
  final pref = await AuthLocalDatasource().getAuthData();
  final data = pref?.result;

  if (data != null) {
    final token = data.refreshToken;
    // Implementasi untuk mendapatkan refresh token dari penyimpanan lokal
    return token;
  } else {
    return 'Refresh Token Not Found';
  }
}

Future<void> saveToken(Map<String, dynamic> token) async {
  print(token);
  final prefs = await SharedPreferences.getInstance();
  String? data = prefs.getString('auth_data');
  if (data != null) {
    Map<String, dynamic> userData = jsonDecode(data);

    if (userData['result'] != null) {
      Map<String, dynamic>? detailData = userData['result'];
      detailData?['userID'] = token['userID'];
      detailData?['accessToken'] = token['accessToken'];
      detailData?['refreshToken'] = token['refreshToken'];
      detailData?['expiresIn'] = token['expiresIn'];
      detailData?['expiresAt'] = token['expiresAt'];
      detailData?['refreshexpiresIn'] = token['refreshexpiresIn'];
      detailData?['refreshexpiresAt'] = token['refreshexpiresAt'];

      String updatedUserDataString = jsonEncode(userData);

      // Simpan kembali data yang telah diubah ke SharedPreferences
      await prefs.setString('auth_data', updatedUserDataString);
    }
  }
  // Implementasi untuk menyimpan token baru ke penyimpanan lokal
}
