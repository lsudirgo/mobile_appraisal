import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_appraisal/data/datasources/auth/auth_user_remote_datasource.dart';

part 'logout_event.dart';
part 'logout_state.dart';
part 'logout_bloc.freezed.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthUserRemoteDatasource _authUserRemoteDatasource;
  LogoutBloc(this._authUserRemoteDatasource) : super(const _LogoutInitial()) {
    on<_Logout>((event, emit) async {
      emit(const _LogoutLoading());
      final result = await _authUserRemoteDatasource.logOut();

      result.fold(
        (l) => emit(_LogoutError(l)),
        (r) => emit(_LogoutSuccess(r)),
      );
    });
  }
}
