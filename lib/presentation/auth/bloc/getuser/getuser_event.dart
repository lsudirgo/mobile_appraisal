part of 'getuser_bloc.dart';

@freezed
class GetuserEvent with _$GetuserEvent {
  const factory GetuserEvent.started() = _Started;
  const factory GetuserEvent.getuser(String userid) = _Getuser;
}
