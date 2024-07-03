part of 'updateprofile_bloc.dart';

@freezed
class UpdateprofileEvent with _$UpdateprofileEvent {
  const factory UpdateprofileEvent.started() = _Started;

  const factory UpdateprofileEvent.updateprofile(
      {required ProfileUpdate profileUpdate}) = _Updateprofile;
}
