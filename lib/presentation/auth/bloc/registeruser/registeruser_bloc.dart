import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_appraisal/data/models/response/auth/register_user_response_model.dart';

import '../../../../data/datasources/auth/auth_user_remote_datasource.dart';

part 'registeruser_event.dart';
part 'registeruser_state.dart';
part 'registeruser_bloc.freezed.dart';

class RegisteruserBloc extends Bloc<RegisteruserEvent, RegisteruserState> {
  final AuthUserRemoteDatasource _registerUserRemoteDatasource;
  RegisteruserBloc(this._registerUserRemoteDatasource)
      : super(const _RegisterInitial()) {
    on<_Registeruser>((event, emit) async {
      emit(const _RegisterLoading());
      final result = await _registerUserRemoteDatasource.registerUser(
          event.userid, event.newpassword, event.confirmpassword);
      result.fold(
        (l) => emit(
          _RegisterError(l),
        ),
        (r) => emit(
          _RegisterSuccess(r),
        ),
      );
    });
  }
}
