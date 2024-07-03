import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_appraisal/data/datasources/auth/auth_user_remote_datasource.dart';

part 'resetpassword_event.dart';
part 'resetpassword_state.dart';
part 'resetpassword_bloc.freezed.dart';

class ResetpasswordBloc extends Bloc<ResetpasswordEvent, ResetpasswordState> {
  final AuthUserRemoteDatasource _resetPasswordRemoteDatasource;
  ResetpasswordBloc(this._resetPasswordRemoteDatasource)
      : super(const _ResetPassInitial()) {
    on<_Resetpassword>((event, emit) async {
      emit(const _ResetPassLoading());
      final result = await _resetPasswordRemoteDatasource.resetpassword(
          event.userid, event.password, event.confirmasipassword);

      result.fold(
        (l) => emit(
          _ResetPassError(l),
        ),
        (r) => emit(
          _ResetPassSuccess(r),
        ),
      );
    });
  }
}
