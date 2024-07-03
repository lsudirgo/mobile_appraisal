part of 'registeruser_bloc.dart';

@freezed
class RegisteruserEvent with _$RegisteruserEvent {
  const factory RegisteruserEvent.started() = _Started;

  const factory RegisteruserEvent.registeruser(
          String userid, String newpassword, String confirmpassword) =
      _Registeruser;
}
