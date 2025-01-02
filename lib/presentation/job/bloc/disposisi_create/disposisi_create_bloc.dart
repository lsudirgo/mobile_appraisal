import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_appraisal/data/datasources/job/job_list_datasource.dart';
import 'package:mobile_appraisal/data/models/request/userdisposisi/disposisi_request_model.dart';
import 'package:mobile_appraisal/data/models/response/job/disposisi_response_model.dart';

part 'disposisi_create_event.dart';
part 'disposisi_create_state.dart';
part 'disposisi_create_bloc.freezed.dart';

class DisposisiCreateBloc
    extends Bloc<DisposisiCreateEvent, DisposisiCreateState> {
  final JobListRemoteDatasource disposisiCreateSource;

  DisposisiCreateBloc(this.disposisiCreateSource)
      : super(const _InitialDisposisiCreate()) {
    on<_CreateDisposisi>((event, emit) async {
      emit(const _LoadingDisposisiCreate());

      final result = await disposisiCreateSource
          .postDisposisiOrder(event.disposisiCreateRequest);
      result.fold(
        (l) => emit(_ErrorDisposisiCreate(l)),
        (r) => emit(_SuccessDisposisiCreate(r)),
      );
    });
  }
}
