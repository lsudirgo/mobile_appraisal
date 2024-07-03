part of 'listjabatan_bloc.dart';

@freezed
class ListjabatanState with _$ListjabatanState {
  const factory ListjabatanState.initial() = _ListJabatanInitial;

  const factory ListjabatanState.loading() = _ListJabatanLoading;

  const factory ListjabatanState.success(ListJabatan result) =
      _ListJabatanSuccess;

  const factory ListjabatanState.error(String error) = _ListJabatanError;
}
