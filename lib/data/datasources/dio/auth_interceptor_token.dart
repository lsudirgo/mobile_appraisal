import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mobile_appraisal/core/core.dart';
import 'package:mobile_appraisal/core/navigation_service.dart';
import 'package:mobile_appraisal/data/datasources/auth/auth_local_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenInterceptor extends Interceptor {
  final dio = Dio(
    BaseOptions(
      connectTimeout: Duration(seconds: AppConfig.timeOut),
      receiveTimeout: Duration(seconds: AppConfig.receivetimeOut),
      validateStatus: (status) {
        return status! < 500; // Validasi status yang diizinkan
      },
    ),
  );

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final authData = await AuthLocalDatasource().getAuthData();

    final DateTime? expiresAt = authData?.result!.expiresAt;
    final String token = authData?.result?.accessToken ?? '';
    final String useridData = authData?.result?.userId ?? '';
    final expToken = await isTokenExpired(expiresAt!);

    if (token.isNotEmpty && !expToken) {
      options.contentType = "application/json";
      options.headers['Content-Type'] = "application/json";
      options.headers['Accept'] = "application/json";
      options.headers["Authorization"] = "Bearer $token";
    } else {
      try {
        String? refreshToken = await getRefreshToken();
        Response response = await dio.post(
          AppConfig.refreshToken,
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json"
            },
          ),
          data: jsonEncode({"refreshToken": refreshToken}),
        );

        if (response.data['statusCode'] == 200) {
          Map<String, dynamic>? newToken = response.data['result'];
          if (newToken != null) {
            await saveToken(newToken);
          }
        } else {
          await saveUserid(useridData);
          AuthLocalDatasource().deleteAuthData();
          redirectToLogin();
        }
      } catch (e) {
        await saveUserid(useridData);
        AuthLocalDatasource().deleteAuthData();
        redirectToLogin();
      }
    }
    return handler.next(options);
  }

  Future<bool> isTokenExpired(DateTime expiresAt) async {
    final DateTime now = DateTime.now();
    return now.isAfter(expiresAt);
  }

  Future<String?> getRefreshToken() async {
    final pref = await AuthLocalDatasource().getAuthData();
    final data = pref?.result;

    if (data != null) {
      final token = data.refreshToken;
      return token;
    } else {
      return null;
    }
  }

  Future<void> saveToken(Map<String, dynamic>? token) async {
    final prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('auth_data');
    if (data != null) {
      Map<String, dynamic> userData = jsonDecode(data);

      if (userData['result'] != null) {
        Map<String, dynamic>? detailData = userData['result'];
        detailData?['userID'] = token?['userID'];
        detailData?['accessToken'] = token?['accessToken'];
        detailData?['refreshToken'] = token?['refreshToken'];
        detailData?['expiresIn'] = token?['expiresIn'];
        detailData?['expiresAt'] = token?['expiresAt'];
        detailData?['refreshexpiresIn'] = token?['refreshexpiresIn'];
        detailData?['refreshexpiresAt'] = token?['refreshexpiresAt'];

        String updatedUserDataString = jsonEncode(userData);

        await prefs.setString('auth_data', updatedUserDataString);
      }
    }
  }

  Future<void> saveUserid(String userid) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', userid);
  }
}
