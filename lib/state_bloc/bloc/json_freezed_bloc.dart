import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_research/models/list.dart';
import 'package:state_research/util/helper.dart';

part 'json_freezed_bloc.freezed.dart';
part 'json_freezed_event.dart';
part 'json_freezed_state.dart';

class JsonFreezedBloc extends Bloc<JsonFreezedEvent, JsonFreezedState> {
  JsonFreezedBloc() : super(const Initial()) {
    on<JsonFetched>((event, emit) async {
      emit(const JsonFreezedState.loading());

      final response = await Helper.getLocalJson();

      JsonList jsonList = JsonList.fromJson(response);
      emit(JsonFreezedState.loaded(json: jsonList));
    });
  }
}
