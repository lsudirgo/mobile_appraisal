import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_appraisal/data/datasources/master/list_master_datasource.dart';
import 'package:mobile_appraisal/data/models/response/master/user_disposisi/list_userdisposisi_response_model.dart';

part 'list_user_disposisi_event.dart';
part 'list_user_disposisi_state.dart';
part 'list_user_disposisi_bloc.freezed.dart';

class ListUserDisposisiBloc
    extends Bloc<ListUserDisposisiEvent, ListUserDisposisiState> {
  final ListMasterRemoteDatasource listDisposisiSource;
  ListUserDisposisiBloc(this.listDisposisiSource)
      : super(const _ListDisposisiInitial()) {
    on<_ListUserDisposisi>((event, emit) async {
      emit(const _ListDisposisiLoading());
      final result = await listDisposisiSource.getListMasterUserDisposisi(
          event.page, event.limit, event.q);

      result.fold((l) => emit(_ListDisposisiError(l)),
          (r) => emit(_ListDisposisiSuccess(r)));
    });
  }
}
