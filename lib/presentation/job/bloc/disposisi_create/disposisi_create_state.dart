part of 'disposisi_create_bloc.dart';

@freezed
class DisposisiCreateState with _$DisposisiCreateState {
  const factory DisposisiCreateState.initial() = _InitialDisposisiCreate;
  const factory DisposisiCreateState.loading() = _LoadingDisposisiCreate;
  const factory DisposisiCreateState.success(Disposisi result) =
      _SuccessDisposisiCreate;
  const factory DisposisiCreateState.error(String error) =
      _ErrorDisposisiCreate;
}
