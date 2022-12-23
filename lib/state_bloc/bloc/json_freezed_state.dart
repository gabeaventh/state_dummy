part of 'json_freezed_bloc.dart';

@freezed
class JsonFreezedState with _$JsonFreezedState {
  const factory JsonFreezedState.initial() = Initial;
  const factory JsonFreezedState.loaded({JsonList? json}) = Loaded;
  const factory JsonFreezedState.loading() = Loading;
}
