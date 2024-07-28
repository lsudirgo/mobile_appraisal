import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mobile_appraisal/core/config.dart';
import 'package:mobile_appraisal/core/extensions/dio_exception_handle.dart';
import 'package:mobile_appraisal/core/extensions/error_message_ext.dart';
import 'package:mobile_appraisal/core/singleton_dio.dart';
import 'package:mobile_appraisal/data/datasources/auth/auth_local_datasource.dart';
import 'package:mobile_appraisal/data/models/request/profile/profile_update_request_model.dart';
import 'package:mobile_appraisal/data/models/response/profile/profile_update_response_model.dart';

final clientdio = DioClient().dio;

class ProfileUpdateRemoteDatasource {
  Future<Either<String, UpdateProfile>> postUpdateProfile(
      ProfileUpdate profileUpdate) async {
    await Future.delayed(Duration(seconds: AppConfig.delay));
    try {
      final authData = await AuthLocalDatasource().getAuthData();

      final url = AppConfig.urlupdateProfile;

      final response = await clientdio.post(
        url,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer ${authData?.result?.accessToken}"
          },
        ),
        data: profileUpdate.toJson(),
      );

      final jsonData = response.data;

      if (jsonData['statusCode'] == 200) {
        // Jika status code 200 (berhasil)
        final result = UpdateProfile.fromMap(
            jsonData); // Ubah respons JSON menjadi objek ListJabatan

        return Right(result); // Mengembalikan hasil list jabatan
      } else if (jsonData['statusCode'] > 200) {
        String? errorMessage;
        if (jsonData['statusCode'] == 400) {
          errorMessage = getErrorMessage(jsonData, jsonData['statusCode']);
        } else {
          errorMessage = getErrorMessage(jsonData, jsonData['statusCode']);
        }
        return Left(errorMessage);
      } else {
        return Left(jsonData['message']); // Jika terjadi kesalahan lainnya
      }
    } catch (e) {
      return Left(handleDioException(e).value);
    }
  }
}
