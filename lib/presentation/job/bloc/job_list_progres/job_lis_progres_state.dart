part of 'job_lis_progres_bloc.dart';

@freezed
class JobLisProgresState with _$JobLisProgresState {
  const factory JobLisProgresState.initial() = _JobListProgressInitial;

  const factory JobLisProgresState.loading() = _JobListProgressLoading;

  const factory JobLisProgresState.success(JobListRespnseModel result) =
      _JobListProgressSuccess;

  const factory JobLisProgresState.error(String error) = _JobListProgressError;
}
