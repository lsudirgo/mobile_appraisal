import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_appraisal/data/datasources/dashboard/dashboard_datasource.dart';

import '../../../../data/models/response/dashboard/dashboard_progress.dart';

part 'dashboard_progress_event.dart';
part 'dashboard_progress_state.dart';
part 'dashboard_progress_bloc.freezed.dart';

class DashboardProgressBloc
    extends Bloc<DashboardProgressEvent, DashboardProgressState> {
  final DashboardRemoteDatasource dashboardRemoteDatasource;

  DashboardProgressBloc(this.dashboardRemoteDatasource)
      : super(const _DashboardProgressInitial()) {
    on<_GetDashboardProgress>((event, emit) async {
      emit(const _DashboardProgressLoading());

      final result = await dashboardRemoteDatasource.getReportProgress();

      result.fold(
        (l) => emit(_DashboardProgressError(l)),
        (r) => emit(_DashboardProgressSuccess(r)),
      );
    });
  }
}
