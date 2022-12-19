import 'dart:convert';

import 'package:flutter/services.dart';

class Helper {
  static Future<dynamic> getLocalJson() async {
    final String response =
        await rootBundle.loadString('assets/dummy_json.json');
    await Future.delayed(const Duration(seconds: 1));
    return await json.decode(response);
  }
}
