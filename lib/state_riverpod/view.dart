import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_research/state_riverpod/components/empty.dart';
import 'package:state_research/state_riverpod/components/list.dart';
import 'package:state_research/state_riverpod/state.dart';
import 'package:state_research/widgets/loading.dart';

class RiverpodView extends HookConsumerWidget {
  const RiverpodView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(jsonNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod View'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: data.value?.data?.isEmpty == true
            ? RiverpodEmptyWidget(
                onPressed: () =>
                    ref.read(jsonNotifierProvider.notifier).getJson(),
              )
            : data.maybeWhen(
                loading: () => const LoadingWidget(),
                data: (state) => RiverpodListWidget(data: state.data),
                orElse: () => Container(),
              ),
      ),
    );
  }
}
