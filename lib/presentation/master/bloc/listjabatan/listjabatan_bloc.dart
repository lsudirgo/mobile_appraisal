import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_appraisal/data/datasources/master/list_master_datasource.dart';
import 'package:mobile_appraisal/data/models/response/master/list_jabatan_response_model.dart';

part 'listjabatan_event.dart';
part 'listjabatan_state.dart';
part 'listjabatan_bloc.freezed.dart';

class ListjabatanBloc extends Bloc<ListjabatanEvent, ListjabatanState> {
  final ListMasterRemoteDatasource listJabatanRemoteDatasource;
  ListjabatanBloc(this.listJabatanRemoteDatasource)
      : super(const _ListJabatanInitial()) {
    on<_ListJabatan>((event, emit) async {
      emit(const _ListJabatanLoading());
      final result = await listJabatanRemoteDatasource.getListMasterJabatan(
          event.page, event.limit, event.q);

      result.fold((l) => emit(_ListJabatanError(l)),
          (r) => emit(_ListJabatanSuccess(r)));
    });
  }
}
