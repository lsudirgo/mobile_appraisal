part of 'dashboard_progress_bloc.dart';

@freezed
class DashboardProgressEvent with _$DashboardProgressEvent {
  const factory DashboardProgressEvent.started() = _Started;

  const factory DashboardProgressEvent.getDashboardProgress() =
      _GetDashboardProgress;
}
