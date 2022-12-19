import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_research/models/list.dart';

import '../../util/helper.dart';

part 'json_bloc_event.dart';
part 'json_bloc_state.dart';

class JsonBloc extends Bloc<JsonBlocEvent, JsonBlocState> {
  JsonBloc() : super(JsonBlocInitial()) {
    on<JsonFetched>((event, emit) async {
      emit(JsonBlocLoading());

      final response = await Helper.getLocalJson();

      JsonList jsonList = JsonList.fromJson(response);
      emit(JsonBlocLoaded(json: jsonList));
    });
  }
}
