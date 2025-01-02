import 'package:dartz/dartz.dart';
import 'package:mobile_appraisal/core/core.dart';
import 'package:mobile_appraisal/core/extensions/dio_exception_handle.dart';
import 'package:mobile_appraisal/data/datasources/dio/singleton_dio.dart';
import 'package:mobile_appraisal/data/models/response/dashboard/dashboard_done.dart';
import 'package:mobile_appraisal/data/models/response/dashboard/dashboard_progress.dart';

import '../../models/response/dashboard/dashboard_pending.dart';

final dioClient = DioClient().dio;

class DashboardRemoteDatasource {
  Future<Either<String, DashboardDone>> getReportYear(String? year) async {
    await Future.delayed(Duration(seconds: AppConfig.delay));
    try {
      final url = '${AppConfig.urlDashboardDone}?year=$year';

      final response = await dioClient().get(
        url,
      );

      final jsonData = response.data;

      if (jsonData['statusCode'] == 200) {
        // Jika status code 200 (berhasil)
        final result = DashboardDone.fromMap(
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

  Future<Either<String, DashboardPending>> getReportPending() async {
    await Future.delayed(Duration(seconds: AppConfig.delay));
    try {
      final url = AppConfig.urlDashboardPending;

      final response = await dioClient().get(
        url,
      );

      final jsonData = response.data;

      if (jsonData['statusCode'] == 200) {
        // Jika status code 200 (berhasil)
        final result = DashboardPending.fromMap(
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

  Future<Either<String, DashboardProgress>> getReportProgress() async {
    await Future.delayed(Duration(seconds: AppConfig.delay));
    try {
      final url = AppConfig.urlDashboardProgress;

      final response = await dioClient().get(
        url,
      );

      final jsonData = response.data;

      if (jsonData['statusCode'] == 200) {
        // Jika status code 200 (berhasil)
        final result = DashboardProgress.fromMap(
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
