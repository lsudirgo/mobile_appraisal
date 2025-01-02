part of 'dashboard_done_bloc.dart';

@freezed
class DashboardDoneState with _$DashboardDoneState {
  const factory DashboardDoneState.initial() = _DashboardDoneInitial;

  const factory DashboardDoneState.loading() = _DashboardDoneLoading;

  const factory DashboardDoneState.success(DashboardDone result) =
      _DashboardDoneSuccess;

  const factory DashboardDoneState.error(String error) = _DashboardDoneError;
}
