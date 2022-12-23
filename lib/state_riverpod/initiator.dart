import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_research/models/detail.dart';
import 'package:state_research/state_riverpod/state.dart';

class RiverpodViewInitiator {
  late WidgetRef ref;
  final AsyncValue<List<Data>> _data = const AsyncValue.data([]);
  void init(BuildContext context, WidgetRef r) {
    ref = r;
  }

  AsyncValue<List<Data>> get data => ref.watch(jsonRiverpodProvider).maybeWhen(
        orElse: () => _data,
        data: (state) => AsyncValue.data(state.data ?? []),
        loading: () => const AsyncValue.loading(),
      );

  void dispose() {}

  void getJson() {
    ref.read(jsonRiverpodProvider.notifier).getJson();
  }
}
