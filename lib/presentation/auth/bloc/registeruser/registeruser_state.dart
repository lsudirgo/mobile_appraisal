part of 'registeruser_bloc.dart';

@freezed
class RegisteruserState with _$RegisteruserState {
  const factory RegisteruserState.initial() = _RegisterInitial;

  const factory RegisteruserState.loading() = _RegisterLoading;

  const factory RegisteruserState.success(RegisteruserModel result) =
      _RegisterSuccess;

  const factory RegisteruserState.error(String error) = _RegisterError;
}
