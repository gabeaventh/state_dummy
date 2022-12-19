import 'package:get/get.dart';
import 'package:state_research/bind.dart';
import 'package:state_research/main.dart';
import 'package:state_research/state_bloc/view.dart';
import 'package:state_research/state_provider/view.dart';
import 'package:state_research/state_riverpod/view.dart';

class AppRoutes {
  static List<GetPage> getRotues = [
    GetPage(
      name: AppRouteNames.home,
      page: () => const MyHomePage(
        title: "Flutter State Management Demo",
      ),
    ),
    GetPage(
      name: AppRouteNames.bloc,
      page: () => const BlocView(),
      binding: AppBinding(),
    ),
    GetPage(
      name: AppRouteNames.provider,
      page: () => const ProviderView(),
    ),
    GetPage(
      name: AppRouteNames.riverpod,
      page: () => const RiverpodView(),
      binding: AppBinding(),
    ),
  ];
}

class AppRouteNames {
  static const String home = '/';
  static const String bloc = '/bloc';
  static const String provider = '/provider';
  static const String riverpod = '/riverpod';
}
