part of 'dashboard_done_bloc.dart';

@freezed
class DashboardDoneEvent with _$DashboardDoneEvent {
  const factory DashboardDoneEvent.started() = _Started;

  const factory DashboardDoneEvent.getDashboardDone(String? year) =
      _GetDashboardDone;
}
