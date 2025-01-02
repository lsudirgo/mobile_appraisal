part of 'dashboard_pending_bloc.dart';

@freezed
class DashboardPendingState with _$DashboardPendingState {
  const factory DashboardPendingState.initial() = _DashboardPendingInitial;

  const factory DashboardPendingState.loading() = _DashboardPendingLoading;

  const factory DashboardPendingState.success(DashboardPending result) =
      _DashboardPendingSuccess;

  const factory DashboardPendingState.error(String error) =
      _DashboardPendingError;
}
