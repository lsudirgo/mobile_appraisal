part of 'resetpassword_bloc.dart';

@freezed
class ResetpasswordEvent with _$ResetpasswordEvent {
  const factory ResetpasswordEvent.started() = _Started;

  const factory ResetpasswordEvent.resetpassword(
      {required String userid,
      required String password,
      required String confirmasipassword}) = _Resetpassword;
}
