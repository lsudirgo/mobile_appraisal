part of 'listjabatan_bloc.dart';

@freezed
class ListjabatanEvent with _$ListjabatanEvent {
  const factory ListjabatanEvent.started() = _Started;
  const factory ListjabatanEvent.listJabatan(int page, int limit, String? q) =
      _ListJabatan;
}
