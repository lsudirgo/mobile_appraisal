import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_appraisal/data/models/response/auth/auth_user_response_model.dart';

import '../../../../data/datasources/auth/auth_user_remote_datasource.dart';

part 'getuser_event.dart';
part 'getuser_state.dart';
part 'getuser_bloc.freezed.dart';

class GetuserBloc extends Bloc<GetuserEvent, GetuserState> {
  final AuthUserRemoteDatasource _authUserRemoteDatasource;
  GetuserBloc(
    this._authUserRemoteDatasource,
  ) : super(const _Initial()) {
    on<_Getuser>((event, emit) async {
      emit(const _Loading());
      final result = await _authUserRemoteDatasource.findUser(event.userid);

      result.fold((l) => emit(_Error(l)), (r) => emit(_Success(r)));
    });
  }
}
