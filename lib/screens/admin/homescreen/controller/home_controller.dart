import 'package:get/get.dart';
import '../../accountscreen/view/account_scrceen.dart';
import '../../adminpanelscreen/view/admin_panel_screen.dart';
import '../../menuscreen/view/menu_screen.dart';

class HomeController extends GetxController {
  RxInt i = 0.obs;
  RxList screenList = [MenuScreen(), AdminPanelScreen(), AccountScreen()].obs;
}
