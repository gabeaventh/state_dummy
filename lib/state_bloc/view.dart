import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:state_research/state_bloc/bloc/json_freezed_bloc.dart';
import 'package:state_research/state_bloc/components/empty.dart';
import 'package:state_research/state_bloc/components/list.dart';
import 'package:state_research/widgets/loading.dart';

class BlocView extends StatelessWidget {
  const BlocView({super.key});

  void getJson() {
    Get.find<JsonFreezedBloc>().add(const JsonFreezedEvent.jsonFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc View'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: BlocBuilder<JsonFreezedBloc, JsonFreezedState>(
          bloc: Get.find<JsonFreezedBloc>(),
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const LoadingWidget(),
              loaded: (state) => BlocListWidget(data: state?.data),
              orElse: () => BlocEmptyWidget(onPressed: getJson),
            );
          },
        ),
      ),
    );
  }
}
