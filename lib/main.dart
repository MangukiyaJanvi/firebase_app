import 'package:firebase_app/screens/admin/accountscreen/view/account_scrceen.dart';
import 'package:firebase_app/screens/admin/addscreen/view/add_screen.dart';
import 'package:firebase_app/screens/admin/adminpanelscreen/view/admin_panel_screen.dart';
import 'package:firebase_app/screens/admin/homescreen/view/home_screen.dart';
import 'package:firebase_app/screens/admin/loginscreen/view/signin_screen.dart';
import 'package:firebase_app/screens/admin/loginscreen/view/signup_screen.dart';
import 'package:firebase_app/screens/admin/menuscreen/model/menu_model.dart';
import 'package:firebase_app/screens/admin/menuscreen/view/data_screen.dart';
import 'package:firebase_app/screens/admin/menuscreen/view/menu_screen.dart';
import 'package:firebase_app/screens/admin/onetimescreen/view/admin_detail.dart';
import 'package:firebase_app/screens/admin/onetimescreen/view/deatails_screen.dart';
import 'package:firebase_app/screens/admin/onetimescreen/view/one_time_one.dart';
import 'package:firebase_app/screens/admin/onetimescreen/view/one_time_third.dart';
import 'package:firebase_app/screens/admin/onetimescreen/view/ont_time_second.dart';
import 'package:firebase_app/screens/user/cartscreen/model/cart_model.dart';
import 'package:firebase_app/screens/user/cartscreen/view/cart_screen.dart';
import 'package:firebase_app/screens/user/oredrscreen/model/oreder_model.dart';
import 'package:firebase_app/screens/user/oredrscreen/view/check_out_screen.dart';
import 'package:firebase_app/screens/user/splashscreen/user_splash.dart';
import 'package:firebase_app/screens/user/userscreen/user_home_screen.dart';
import 'package:firebase_app/utils/notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'screens/admin/loginscreen/view/login_admin.dart';
import 'screens/admin/splashscreen/view/splash_screen.dart';

List<MenuModel> list = [];
List<CartModel> cartList = [];
List<OrderModel> orderList = [];
List listComment = [
  "''Atlantis collection is excellent. Will recommend''",
  "''Plant is growing happily and I can see new leaves popping out.''",
  "''The plant came as healthy live plant. After repotting, it is still ok. Waiting for the plant to grow new leafes.''"
];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await NotificationServise.notificationServise.initNotification();
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(
            name: '/',
            page: () => SplashScreen(),
          ),
          GetPage(
            name: '/usersplash',
            page: () => UserSplashScreen(),
          ),
          GetPage(
              name: '/order',
              page: () => CheckOutScreen(),
              curve: Curves.bounceOut),
          GetPage(
            name: '/one',
            page: () => OneScreen(),
          ),
          GetPage(
            name: '/second',
            page: () => OneSecondScreen(),
          ),
          GetPage(
            name: '/third',
            page: () => OneThirdScreen(),
          ),
          GetPage(
            name: '/detail',
            page: () => DetailsScreen(),
          ),
          GetPage(
            name: '/adminDetail',
            page: () => AdminDetailsScreen(),
          ),
          GetPage(
            name: '/loginadmin',
            page: () => LoginAdminAcreen(),
          ),
          GetPage(
            name: '/signin',
            page: () => SignInScreen(),
          ),
          GetPage(
            name: '/signup',
            page: () => SignUpScreen(),
          ),
          GetPage(
            name: '/home',
            page: () => HomeScreen(),
          ),
          GetPage(
            name: '/userhome',
            page: () => UserHomeScreen(),
          ),
          GetPage(
            name: '/add',
            page: () => AddScreen(),
          ),
          GetPage(
            name: '/menu',
            page: () => MenuScreen(),
          ),
          GetPage(
            name: '/panel',
            page: () => AdminPanelScreen(),
          ),
          GetPage(
            name: '/account',
            page: () => AccountScreen(),
          ),
          GetPage(
            name: '/data',
            page: () => DataScreen(),
          ),
          GetPage(
            name: '/cart',
            page: () => CartScreen(),
          ),
        ],
      ),
    ),
  );
}
