import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class CoreInitiator {
  void init(BuildContext context, WidgetRef r);
  void dispose(BuildContext context);
}
