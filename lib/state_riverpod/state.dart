import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_research/models/list.dart';
import 'package:state_research/util/helper.dart';

class JsonNotifier extends StateNotifier<AsyncValue<JsonList>> {
  JsonNotifier() : super(AsyncValue.data(JsonList(data: [])));

  void getJson() async {
    state = const AsyncValue.loading();
    final response = await Helper.getLocalJson();

    JsonList jsonList = JsonList.fromJson(response);

    state = AsyncValue.data(jsonList);
  }
}

final jsonNotifierProvider =
    StateNotifierProvider.autoDispose<JsonNotifier, AsyncValue<JsonList>>(
  (ref) => JsonNotifier(),
);
