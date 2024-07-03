part of 'getuser_bloc.dart';

@freezed
class GetuserState with _$GetuserState {
  const factory GetuserState.initial() = _Initial;
  const factory GetuserState.loading() = _Loading;
  const factory GetuserState.success(AuthUserResponseModel result) = _Success;
  const factory GetuserState.error(String error) = _Error;
}
