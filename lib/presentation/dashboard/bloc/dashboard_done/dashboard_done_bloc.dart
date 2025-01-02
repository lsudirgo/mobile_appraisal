import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_appraisal/data/datasources/dashboard/dashboard_datasource.dart';
import 'package:mobile_appraisal/data/models/response/dashboard/dashboard_done.dart';

part 'dashboard_done_event.dart';
part 'dashboard_done_state.dart';
part 'dashboard_done_bloc.freezed.dart';

class DashboardDoneBloc extends Bloc<DashboardDoneEvent, DashboardDoneState> {
  final DashboardRemoteDatasource dashboardRemoteDatasource;

  DashboardDoneBloc(this.dashboardRemoteDatasource)
      : super(const _DashboardDoneInitial()) {
    on<_GetDashboardDone>((event, emit) async {
      emit(const _DashboardDoneLoading());

      final result = await dashboardRemoteDatasource.getReportYear(event.year);

      result.fold((l) => emit(_DashboardDoneError(l)),
          (r) => emit(_DashboardDoneSuccess(r)));
    });
  }
}
