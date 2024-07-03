part of 'logout_bloc.dart';

@freezed
class LogoutState with _$LogoutState {
  const factory LogoutState.initial() = _LogoutInitial;

  const factory LogoutState.loading() = _LogoutLoading;

  const factory LogoutState.success(String result) = _LogoutSuccess;

  const factory LogoutState.error(String error) = _LogoutError;
}
