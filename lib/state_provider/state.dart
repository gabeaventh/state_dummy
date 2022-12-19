import 'package:flutter/material.dart';
import 'package:state_research/models/detail.dart';
import 'package:state_research/models/list.dart';
import 'package:state_research/util/helper.dart';

class JsonState extends ChangeNotifier {
  List<Data>? json;
  bool isLoading = false;

  void getJson() async {
    isLoading = true;
    notifyListeners();
    final response = await Helper.getLocalJson();

    JsonList jsonList = JsonList.fromJson(response);

    json = jsonList.data;
    isLoading = false;
    notifyListeners();
  }
}
