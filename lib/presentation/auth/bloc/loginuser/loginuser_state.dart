part of 'loginuser_bloc.dart';

@freezed
class LoginuserState with _$LoginuserState {
  const factory LoginuserState.initial() = _LoginInitial;

  const factory LoginuserState.loading() = _LoginLoading;

  const factory LoginuserState.success(AuthLoginModel result) = _LoginSuccess;

  const factory LoginuserState.error(String error) = _LoginError;
}
