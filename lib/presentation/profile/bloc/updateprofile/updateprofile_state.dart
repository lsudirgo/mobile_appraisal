part of 'updateprofile_bloc.dart';

@freezed
class UpdateprofileState with _$UpdateprofileState {
  const factory UpdateprofileState.initial() = _UpdateProfileInitial;

  const factory UpdateprofileState.loading() = _UpdateProfileLoading;

  const factory UpdateprofileState.success(UpdateProfile result) =
      _UpdateProfileSuccess;

  const factory UpdateprofileState.error(String error) = _UpdateProfileError;
}
