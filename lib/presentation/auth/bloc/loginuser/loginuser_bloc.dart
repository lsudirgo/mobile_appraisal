import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_appraisal/data/datasources/auth/auth_user_remote_datasource.dart';
import 'package:mobile_appraisal/data/models/response/auth/auth_login_response_model.dart';

part 'loginuser_event.dart';
part 'loginuser_state.dart';
part 'loginuser_bloc.freezed.dart';

class LoginuserBloc extends Bloc<LoginuserEvent, LoginuserState> {
  final AuthUserRemoteDatasource _authUserRemoteDatasource;
  LoginuserBloc(this._authUserRemoteDatasource) : super(const _LoginInitial()) {
    on<_Loginuser>((event, emit) async {
      emit(const _LoginLoading());
      final result = await _authUserRemoteDatasource.authLogin(
          event.userid, event.password);

      result.fold(
          (l) => emit(
                _LoginError(l),
              ), (r) {
        emit(
          _LoginSuccess(r),
        );
      });
    });
  }
}
