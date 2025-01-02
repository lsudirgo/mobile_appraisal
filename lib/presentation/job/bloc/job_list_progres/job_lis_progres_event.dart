part of 'job_lis_progres_bloc.dart';

@freezed
class JobLisProgresEvent with _$JobLisProgresEvent {
  const factory JobLisProgresEvent.started() = _Started;

  const factory JobLisProgresEvent.getJobList(
      {required JobListRequest joblistrequest}) = _JobListProgress;
}
