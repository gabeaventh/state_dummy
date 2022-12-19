import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_research/util/logger.dart';

class RiverpodObserver extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    Log.info('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "previousValue": "$previousValue",
  "newValue": "$newValue",
  "providerContainer": "$container"
}''');
    if (previousValue != null) inspect(previousValue);
    inspect(newValue);
  }
}
