import 'package:get/get.dart';
import 'package:state_research/models/detail.dart';
import 'package:state_research/models/list.dart';
import 'package:state_research/util/helper.dart';

class JsonController extends GetxController {
  final jsonList = <Data>[].obs;
  final isLoading = false.obs;

  void getJson() async {
    isLoading(true);
    final response = await Helper.getLocalJson();

    JsonList list = JsonList.fromJson(response);

    jsonList(list.data);
    isLoading(true);
  }
}
