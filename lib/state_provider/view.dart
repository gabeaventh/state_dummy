import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_research/state_provider/components/empty.dart';
import 'package:state_research/state_provider/components/list.dart';
import 'package:state_research/state_provider/state.dart';
import 'package:state_research/widgets/loading.dart';

class ProviderView extends StatelessWidget {
  const ProviderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider View'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Consumer<JsonState>(
          builder: (context, state, child) {
            return state.isLoading
                ? const LoadingWidget()
                : state.json?.isNotEmpty == true
                    ? ProviderListWidget(data: state.json)
                    : ProviderEmptyWidget(
                        onPressed: () => state.getJson(),
                      );
          },
        ),
      ),
    );
  }
}
