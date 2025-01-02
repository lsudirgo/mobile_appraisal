part of 'disposisi_create_bloc.dart';

@freezed
class DisposisiCreateEvent with _$DisposisiCreateEvent {
  const factory DisposisiCreateEvent.started() = _StartedDisposisiCreate;
  const factory DisposisiCreateEvent.createDisposisi(
      {required DisposisiRequest disposisiCreateRequest}) = _CreateDisposisi;
}
