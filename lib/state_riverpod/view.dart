import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_research/state_riverpod/components/empty.dart';
import 'package:state_research/state_riverpod/components/list.dart';
import 'package:state_research/state_riverpod/initiator.dart';
import 'package:state_research/widgets/loading.dart';

class RiverpodView extends StatefulHookConsumerWidget {
  const RiverpodView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RiverpodViewState();
}

class _RiverpodViewState extends ConsumerState<RiverpodView> {
  late RiverpodViewInitiator _i;
  @override
  void initState() {
    super.initState();
    _i = RiverpodViewInitiator()..init(context, ref);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod View'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: _i.data.value?.isEmpty == true
            ? RiverpodEmptyWidget(
                onPressed: () => _i.getJson(),
              )
            : _i.data.maybeWhen(
                loading: () => const LoadingWidget(),
                data: (state) => RiverpodListWidget(data: state),
                orElse: () => Container(),
              ),
      ),
    );
  }
}
