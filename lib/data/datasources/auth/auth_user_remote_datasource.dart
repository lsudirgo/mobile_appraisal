import "dart:convert";
import "package:dartz/dartz.dart";
import "package:dio/dio.dart";
import "package:mobile_appraisal/core/core.dart";
import "package:mobile_appraisal/core/extensions/dio_exception_handle.dart";
import "package:mobile_appraisal/data/datasources/auth/auth_local_datasource.dart";
import "package:mobile_appraisal/data/datasources/profile/profile_update_datasource.dart";
import "package:mobile_appraisal/data/models/response/auth/auth_trace_login_response_model.dart";
import "../dio/singleton_dio.dart";
import "../../models/response/auth/auth_login_response_model.dart";
import "../../models/response/auth/auth_trace_login_update_response_model.dart";
import "../../models/response/auth/auth_user_response_model.dart";
import "../../models/response/auth/register_user_response_model.dart";

final dioClient = DioClient().dio;
final dio = Dio(
  BaseOptions(
    connectTimeout: Duration(seconds: AppConfig.timeOut),
    receiveTimeout: Duration(seconds: AppConfig.receivetimeOut),
    validateStatus: (status) {
      return status! < 500; // Validasi status yang diizinkan
    },
  ),
);

class AuthUserRemoteDatasource {
  Future<Either<String, AuthUserResponseModel>> findUser(String userid) async {
    await Future.delayed(Duration(seconds: AppConfig.delay));
    try {
      final url = "${AppConfig.urlUserID}/$userid";

      final response = await dio.get(
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
        // status code 200 = success
        final result = AuthUserResponseModel.fromJson(response.data);
        return Right(result);
      } else {
        String? errorMessage;
        if (jsonData['statusCode'] == 400) {
          errorMessage = getErrorMessage(jsonData, jsonData['statusCode']);
        } else {
          errorMessage = getErrorMessage(jsonData, jsonData['statusCode']);
        }
        return Left(errorMessage);
      }
    } catch (e) {
      return Left(handleDioException(e).value);
    }
  }

  Future<Either<String, RegisteruserModel>> registerUser(
      String userid, String newpassword, String confirmpassword) async {
    await Future.delayed(Duration(seconds: AppConfig.delay));
    try {
      final url = AppConfig.urlRegister;

      final response = await dio.post(
        url,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        ),
        data: jsonEncode({
          "userID": userid,
          "password": newpassword,
          "confirmPassword": confirmpassword
        }),
      );

      final jsonData = response.data;

      if (jsonData['statusCode'] == 201) {
        // status code 201 = success
        final result = RegisteruserModel.fromJson(response.data);

        return Right(result);
      } else {
        String? errorMessage;
        if (jsonData['statusCode'] == 400) {
          errorMessage = getErrorMessage(jsonData, jsonData['statusCode']);
        } else {
          errorMessage = getErrorMessage(jsonData, jsonData['statusCode']);
        }
        return Left(errorMessage);
      }
    } catch (e) {
      return Left(handleDioException(e).value);
    }
  }

  Future<Either<String, AuthLoginModel>> authLogin(
      String userid, String password) async {
    await Future.delayed(Duration(seconds: AppConfig.delay));
    try {
      final url = AppConfig.urlLogin;

      final response = await dio.post(
        url,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        }),
        data: jsonEncode({
          "userid": userid,
          "password": password,
        }),
      );

      final jsonData = response.data;

      if (jsonData['statusCode'] == 200) {
        // status code 201 = success
        final result = AuthLoginModel.fromJson(response.data);

        // DeviceInfo deviceInfo = await _initDeviceInfo();
        if (result.result?.traceLogin == null) {
          await traceloginCreate(
              result.result!.userId, 'Samsung', 'XXXXXX', 'XXX');
        } else {
          await traceloginUpdate(
              result.result!.userId, 'Samsung Update', 'XXXXXXX', 'XXX');
        }
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

  Future<Either<String, TraceLoginModel>> traceloginCreate(String userid,
      String namadevice, String serialnumber, String physicaldevice) async {
    try {
      final url = AppConfig.urlTraceCreate;

      final response = await dio.post(
        url,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        }),
        data: jsonEncode({
          "userID": userid,
          "namaDevice": namadevice,
          "serialNumber": serialnumber,
          "physicalDevice": physicaldevice
        }),
      );

      final jsonData = response.data;

      if (jsonData['statusCode'] == 200) {
        // status code 201 = success
        final result = TraceLoginModel.fromJson(response.data);

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

  Future<Either<String, UpdateTraceLoginModel>> traceloginUpdate(String userid,
      String namadevice, String serialnumber, String physicaldevice) async {
    try {
      final url = AppConfig.urlTraceUpdate;

      final response = await dio.put(
        url,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        }),
        data: jsonEncode({
          "userID": userid,
          "namaDevice": namadevice,
          "serialNumber": serialnumber,
          "physicalDevice": physicaldevice
        }),
      );

      final jsonData = response.data;

      if (jsonData['statusCode'] == 200) {
        // status code 201 = success
        final result = UpdateTraceLoginModel.fromJson(response.data);

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

  //logout

  Future<Either<String, String>> logOut() async {
    // await Future.delayed(const Duration(seconds: 3));

    try {
      // final authData = await AuthLocalDatasource().getAuthData();
      final url = AppConfig.urlLogout;

      final response = await clientdio().post(url);

      final jsonData = response.data;
      if (jsonData['statusCode'] == 200) {
        AuthLocalDatasource().deleteAuthData();
        return const Right('Logout Berhasil');
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

  Future<Either<String, String>> resetpassword(
      String userid, String password, String confirmasipassword) async {
    await Future.delayed(Duration(seconds: AppConfig.delay));
    try {
      final url = AppConfig.urlResetPassword;

      final response = await dio.put(
        url,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        }),
        data: jsonEncode({
          "userID": userid,
          "password": password,
          "confirmPassword": confirmasipassword
        }),
      );

      final jsonData = response.data;

      if (jsonData['statusCode'] == 200) {
        // status code 201 = success
        final result = jsonData['result'];

        return Right(result);
      } else {
        String? errorMessage;
        if (jsonData['statusCode'] == 400) {
          errorMessage = getErrorMessage(jsonData, jsonData['statusCode']);
        } else {
          errorMessage = getErrorMessage(jsonData, jsonData['statusCode']);
        }
        return Left(errorMessage);
      }
    } catch (e) {
      return Left(handleDioException(e).value);
    }
  }

//   Future<DeviceInfo> _initDeviceInfo() async {
//     DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//     String deviceName;
//     String deviceId;
//     String physicalDevice;

//     if (Platform.isAndroid) {
//       AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//       deviceName = androidInfo.model;
//       deviceId = androidInfo.device;
//       physicalDevice = androidInfo.hardware;
//     } else if (Platform.isIOS) {
//       IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
//       deviceName = iosInfo.name;
//       deviceId = iosInfo.utsname as String;
//       physicalDevice = iosInfo.model;
//     } else {
//       deviceName = '';
//       deviceId = '';
//       physicalDevice = '';
//     }

//     return DeviceInfo(
//       deviceName: deviceName,
//       deviceId: deviceId,
//       physicalDevice: physicalDevice,
//     );
//   }
// }

// class DeviceInfo {
//   final String deviceName;
//   final String deviceId;
//   final String physicalDevice;

//   DeviceInfo({
//     required this.deviceName,
//     required this.deviceId,
//     required this.physicalDevice,
//   });
}
