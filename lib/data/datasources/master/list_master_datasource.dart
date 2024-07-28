import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mobile_appraisal/core/core.dart';
import 'package:mobile_appraisal/core/extensions/dio_exception_handle.dart';
import 'package:mobile_appraisal/data/models/response/master/list_jabatan_response_model.dart';

import '../../../core/singleton_dio.dart';

final dio = DioClient().dio;

class ListMasterRemoteDatasource {
  Future<Either<String, ListJabatan>> getListMasterJabatan(
      int page, int limit, String? q) async {
    try {
      final url = '${AppConfig.urlmasterListJabatan}?page=$page&limit=$limit';

      final response = await Dio().get(
        url,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        ),
      );

      final jsonData = response.data;

      if (jsonData['statusCode'] == 200) {
        // Jika status code 200 (berhasil)
        final result = ListJabatan.fromMap(
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
