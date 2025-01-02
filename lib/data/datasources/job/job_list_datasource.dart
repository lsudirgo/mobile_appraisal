import 'package:dartz/dartz.dart';
import 'package:mobile_appraisal/core/extensions/dio_exception_handle.dart';
import 'package:mobile_appraisal/core/extensions/error_message_ext.dart';
import 'package:mobile_appraisal/data/datasources/dio/singleton_dio.dart';
import 'package:mobile_appraisal/data/models/request/job/job_list_request_model.dart';
import 'package:mobile_appraisal/data/models/request/userdisposisi/disposisi_request_model.dart';
import 'package:mobile_appraisal/data/models/response/job/disposisi_response_model.dart';
import 'package:mobile_appraisal/data/models/response/job/job_list_response_model.dart';

import '../../../core/config.dart';

final clientdio = DioClient().dio;

class JobListRemoteDatasource {
  Future<Either<String, JobListRespnseModel>> getJobList(
      JobListRequest joblistrequest) async {
    await Future.delayed(Duration(seconds: AppConfig.delay));

    try {
      final url = AppConfig.urlJobList;

      final queryParameters = {
        'page': joblistrequest.page.toString(),
        'limit': joblistrequest.limit.toString(),
        'flagpetugas': joblistrequest.flagpetugas.toString(),
        'status': joblistrequest.status.toString(),
        if (joblistrequest.uker != null) 'uker': joblistrequest.uker!,
        if (joblistrequest.q != null) 'q': joblistrequest.q!,
      };

      final uri = Uri.parse(url).replace(queryParameters: queryParameters);

      final response = await clientdio().get(uri.toString());

      final jsonData = response.data;

      if (jsonData['statusCode'] == 200) {
        // Jika status code 200 (berhasil)
        final result = JobListRespnseModel.fromMap(
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

  Future<Either<String, Disposisi>> postDisposisiOrder(
      DisposisiRequest disposisi) async {
    await Future.delayed(Duration(seconds: AppConfig.delay));
    try {
      final url = AppConfig.urlDisposisiOrder;

      final response = await clientdio().post(
        url,
        data: disposisi.toJson(),
      );

      final jsonData = response.data;

      if (jsonData['statusCode'] == 200) {
        final result = Disposisi.fromMap(jsonData);

        return Right(result);
      } else if (jsonData['statusCode'] > 200) {
        String? errorMessage;
        if (jsonData['statusCode'] == 400) {
          errorMessage = getErrorMessage(jsonData, jsonData['statusCode']);
        } else {
          errorMessage = getErrorMessage(jsonData, jsonData['statusCode']);
        }
        return Left(errorMessage);
      } else {
        return Left(jsonData['message']);
      }
    } catch (e) {
      return Left(handleDioException(e).value);
    }
  }
}
