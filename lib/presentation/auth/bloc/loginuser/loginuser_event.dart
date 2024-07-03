part of 'loginuser_bloc.dart';

@freezed
class LoginuserEvent with _$LoginuserEvent {
  const factory LoginuserEvent.started() = _Started;
  const factory LoginuserEvent.authLogin(String userid, String password) =
      _Loginuser;
}
