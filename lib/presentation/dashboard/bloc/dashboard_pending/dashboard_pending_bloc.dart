import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_appraisal/data/datasources/dashboard/dashboard_datasource.dart';
import 'package:mobile_appraisal/data/models/response/dashboard/dashboard_pending.dart';

part 'dashboard_pending_event.dart';
part 'dashboard_pending_state.dart';
part 'dashboard_pending_bloc.freezed.dart';

class DashboardPendingBloc
    extends Bloc<DashboardPendingEvent, DashboardPendingState> {
  final DashboardRemoteDatasource dashboardRemoteDatasource;

  DashboardPendingBloc(this.dashboardRemoteDatasource)
      : super(const _DashboardPendingInitial()) {
    on<_GetDashboardPending>((event, emit) async {
      emit(const _DashboardPendingLoading());

      final result = await dashboardRemoteDatasource.getReportPending();

      result.fold((l) => emit(_DashboardPendingError(l)),
          (r) => emit(_DashboardPendingSuccess(r)));
    });
  }
}
