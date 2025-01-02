part of 'list_user_disposisi_bloc.dart';

@freezed
class ListUserDisposisiEvent with _$ListUserDisposisiEvent {
  const factory ListUserDisposisiEvent.started() = _Started;
  const factory ListUserDisposisiEvent.listUserDisposisi(
      int page, int limit, String? q) = _ListUserDisposisi;
}
