import 'package:get/get.dart';

class AddController extends GetxController {
  RxList categoryList =
      ["Electronics", "Grocery", "Home", "Fashion", "Stationery"].obs;
  RxString cate = "Choose Category".obs;
}
