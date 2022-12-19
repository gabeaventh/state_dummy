import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_research/state_getx/components/empty.dart';
import 'package:state_research/state_getx/components/list.dart';
import 'package:state_research/state_getx/controller.dart';
import 'package:state_research/widgets/loading.dart';

class GetXView extends ConsumerWidget {
  const GetXView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX View'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: GetX<JsonController>(
          builder: (controller) {
            return controller.isLoading.isTrue
                ? const LoadingWidget()
                : controller.jsonList.isNotEmpty
                    ? GetXListWidget(data: controller.jsonList)
                    : GetXEmptyWidget(
                        onPressed: () => controller.getJson(),
                      );
          },
        ),
      ),
    );
  }
}
