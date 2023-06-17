import 'package:firebase_app/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    FbHelper.fbHelper.getemial();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0XFF0F4C36),
          title: Row(
            children: [
              Text(
                "GO",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                "GREEN",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.green.shade100),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.lightGreen.shade50,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.lightGreen.shade900,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    (FbHelper.fbHelper.img != null)
                        ? CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.green.shade50,
                            backgroundImage:
                                NetworkImage("${FbHelper.fbHelper.img}"),
                          )
                        : CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.green.shade50,
                            backgroundImage: AssetImage("assets/images/me.jpg"),
                          ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      (FbHelper.fbHelper.name != null)
                          ? "${FbHelper.fbHelper.name}"
                          : "Janvi Mangukiya",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.sp),
                    ),
                    Text(
                      "${FbHelper.fbHelper.email}",
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Container(
                height: 71.h,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Box(Icons.home, "Home"),
                      Box(Icons.notifications, "Notifications"),
                      Box(Icons.mail_lock, "Inbox"),
                      Box(Icons.person, "Account"),
                      Box(Icons.info, "Info"),
                      Box(Icons.settings, "Settings"),
                      InkWell(
                          onTap: () async {
                           await FbHelper.fbHelper.signOut();
                            Get.offAndToNamed('/');
                          },
                          child: Box(Icons.logout, "LogOut")),
                      Box(Icons.help, "Help"),
                      ListTile(
                        leading: Container(
                          width: 8.w,
                          child: Image.asset('assets/images/admin.png'),
                        ),
                        title: Text('Admin Side'),
                        trailing: Icon(Icons.navigate_next),
                      ),
                      ListTile(
                        leading: Container(
                          width: 8.w,
                          child: Image.asset('assets/images/people.png'),
                        ),
                        title: Text('User Side'),
                        trailing: Icon(Icons.navigate_next),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            onTap: (value) {
              controller.i.value = value;
              print(controller.i.value);
            },
            currentIndex: controller.i.value,
            selectedItemColor: Color(0XFF0F4C36),
            unselectedItemColor: Colors.blueGrey.shade300,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.admin_panel_settings), label: "Panel"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Account"),
            ],
          ),
        ),
        body: Obx(
          () => controller.screenList[controller.i.value],
        ),
      ),
    );
  }

  Widget Box(IconData icon, String data) {
    return ListTile(
      leading: Icon(icon),
      title: Text(data),
      trailing: Icon(Icons.navigate_next),
    );
  }
}
