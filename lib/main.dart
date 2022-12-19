import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart' as provider;
import 'package:state_research/route.dart';
import 'package:state_research/state_provider/state.dart';
import 'package:state_research/util/bloc_observer.dart';
import 'package:state_research/util/logger.dart';
import 'package:state_research/util/riverpod_observer.dart';

void main() {
  runZonedGuarded(() {
    Log.init();
    Bloc.observer = MyBlocObs();
    WidgetsFlutterBinding.ensureInitialized();
    runApp(
      ProviderScope(
        observers: [RiverpodObserver()],
        child: const MyApp(),
      ),
    );
  }, (e, s) {
    debugPrint('Error: $e');
    debugPrint('StackTrace: $s');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return provider.MultiProvider(
      providers: [
        provider.ChangeNotifierProvider<JsonState>(create: (_) => JsonState()),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        navigatorKey: Get.key,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        getPages: AppRoutes.getRotues,
        home: const MyHomePage(title: 'Flutter State Management Demo'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRouteNames.bloc);
              },
              child: const Text('Bloc View'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRouteNames.provider);
              },
              child: const Text('Provider View'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRouteNames.riverpod);
              },
              child: const Text('Riverpod View'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRouteNames.getx);
              },
              child: const Text('GetX View'),
            ),
          ],
        ),
      ),
    );
  }
}
