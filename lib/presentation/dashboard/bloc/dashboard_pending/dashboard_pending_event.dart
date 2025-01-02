part of 'dashboard_pending_bloc.dart';

@freezed
class DashboardPendingEvent with _$DashboardPendingEvent {
  const factory DashboardPendingEvent.started() = _Started;

  const factory DashboardPendingEvent.getDashboardPending() =
      _GetDashboardPending;
}
