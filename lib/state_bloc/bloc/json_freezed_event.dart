part of 'json_freezed_bloc.dart';

@freezed
class JsonFreezedEvent with _$JsonFreezedEvent {
  const factory JsonFreezedEvent.started() = _Started;
  const factory JsonFreezedEvent.jsonFetched() = JsonFetched;
}
