import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

// Fungsi untuk menangani DioException dan mengembalikan pesan kesalahan
Left<String, String> handleDioException(Object e) {
  if (e is DioException) {
    switch (e.type) {
      case DioExceptionType.badCertificate:
        return const Left('Connection Bad Certificate');
      case DioExceptionType.sendTimeout:
        return const Left('Connection Send TimeOut');
      case DioExceptionType.badResponse:
        return const Left('Connection Bad Response');
      case DioExceptionType.connectionTimeout:
        return const Left('Connection Timeout Request');
      case DioExceptionType.receiveTimeout:
        return const Left('Connection Timeout Receive');
      default:
        return const Left('Connection Error');
    }
  } else {
    return Left(e.toString());
  }
}
