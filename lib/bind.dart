import 'package:get/get.dart';
import 'package:state_research/state_bloc/bloc/json_bloc_bloc.dart';
import 'package:state_research/state_bloc/bloc/json_freezed_bloc.dart';
import 'package:state_research/state_getx/controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JsonBloc>(JsonBloc.new);
    Get.lazyPut<JsonController>(JsonController.new);
    Get.lazyPut<JsonFreezedBloc>(JsonFreezedBloc.new);
  }
}
