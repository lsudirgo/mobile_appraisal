part of 'list_user_disposisi_bloc.dart';

@freezed
class ListUserDisposisiState with _$ListUserDisposisiState {
  const factory ListUserDisposisiState.initial() = _ListDisposisiInitial;
  const factory ListUserDisposisiState.loading() = _ListDisposisiLoading;
  const factory ListUserDisposisiState.success(ListUserDisposisi result) =
      _ListDisposisiSuccess;
  const factory ListUserDisposisiState.error(String error) =
      _ListDisposisiError;
}
