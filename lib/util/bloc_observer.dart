import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_research/util/logger.dart';

/// In console logger,
/// Focus on tracking bloc activity
class MyBlocObs extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    Log.info('On Event: $event');
    inspect(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    Log.info('On Transition: $transition');
    inspect(transition.currentState);
    inspect(transition.nextState);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    Log.warning('On Error: $error');
  }
}
