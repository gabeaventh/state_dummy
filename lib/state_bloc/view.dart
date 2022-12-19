import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:state_research/state_bloc/bloc/json_bloc_bloc.dart';
import 'package:state_research/state_bloc/components/empty.dart';
import 'package:state_research/state_bloc/components/list.dart';
import 'package:state_research/widgets/loading.dart';

class BlocView extends StatelessWidget {
  const BlocView({super.key});

  void getJson() {
    Get.find<JsonBloc>().add(JsonFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc View'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: BlocBuilder<JsonBloc, JsonBlocState>(
          bloc: Get.find<JsonBloc>(),
          builder: (context, state) {
            if (state is JsonBlocLoading) {
              return const LoadingWidget();
            }
            if (state is JsonBlocLoaded) {
              return BlocListWidget(data: state.json.data);
            }

            return BlocEmptyWidget(onPressed: getJson);
          },
        ),
      ),
    );
  }
}
