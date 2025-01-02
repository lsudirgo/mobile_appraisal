import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_appraisal/data/datasources/job/job_list_datasource.dart';
import 'package:mobile_appraisal/data/models/request/job/job_list_request_model.dart';
import 'package:mobile_appraisal/data/models/response/job/job_list_response_model.dart';

part 'job_lis_progres_event.dart';
part 'job_lis_progres_state.dart';
part 'job_lis_progres_bloc.freezed.dart';

class JobLisProgresBloc extends Bloc<JobLisProgresEvent, JobLisProgresState> {
  final JobListRemoteDatasource jobListRemoteDatasource;

  JobLisProgresBloc(this.jobListRemoteDatasource)
      : super(const _JobListProgressInitial()) {
    on<_JobListProgress>((event, emit) async {
      emit(const _JobListProgressLoading());

      final result =
          await jobListRemoteDatasource.getJobList(event.joblistrequest);

      result.fold((l) => emit(_JobListProgressError(l)),
          (r) => emit(_JobListProgressSuccess(r)));
    });
  }
}
