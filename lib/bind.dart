import 'package:get/get.dart';
import 'package:state_research/state_bloc/bloc/json_bloc_bloc.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JsonBloc>(JsonBloc.new);
  }
}
