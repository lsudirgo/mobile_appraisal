part of 'resetpassword_bloc.dart';

@freezed
class ResetpasswordState with _$ResetpasswordState {
  const factory ResetpasswordState.initial() = _ResetPassInitial;

  const factory ResetpasswordState.loading() = _ResetPassLoading;

  const factory ResetpasswordState.success(String result) = _ResetPassSuccess;

  const factory ResetpasswordState.error(String error) = _ResetPassError;
}
