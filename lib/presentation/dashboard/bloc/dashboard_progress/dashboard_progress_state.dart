part of 'dashboard_progress_bloc.dart';

@freezed
class DashboardProgressState with _$DashboardProgressState {
  const factory DashboardProgressState.initial() = _DashboardProgressInitial;

  const factory DashboardProgressState.loading() = _DashboardProgressLoading;

  const factory DashboardProgressState.success(DashboardProgress result) =
      _DashboardProgressSuccess;

  const factory DashboardProgressState.error(String error) =
      _DashboardProgressError;
}
