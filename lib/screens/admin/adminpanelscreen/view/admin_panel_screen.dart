import 'package:firebase_app/utils/firebase_helper.dart';
import 'package:firebase_app/utils/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AdminPanelScreen extends StatefulWidget {
  const AdminPanelScreen({Key? key}) : super(key: key);

  @override
  State<AdminPanelScreen> createState() => _AdminPanelScreenState();
}

class _AdminPanelScreenState extends State<AdminPanelScreen> {
  @override
  void initState() {
    super.initState();
    FbHelper.fbHelper.initFirebaseMsG();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ListView(
            children: [
              // ElevatedButton(
              //   onPressed: () {
              //     NotificationServise.notificationServise
              //         .showSimpleNotification();
              //   },
              //   child: Text("Simple Notification"),
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     NotificationServise.notificationServise
              //         .showSchedualNotification();
              //   },
              //   child: Text("Schedual Notification"),
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     NotificationServise.notificationServise
              //         .ShowBigPictureNotification();
              //   },
              //   child: Text("Schedual Notification"),
              // ),
              Row(
                children: [
                  Container(
                    width: 50.w,
                    child: Image.asset("assets/images/Revenue.png"),
                  ),
                  Container(
                    width: 50.w,
                    child: Image.asset("assets/images/Orders.png"),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 50.w,
                    child: Image.asset("assets/images/Visitors.png"),
                  ),
                  Container(
                    width: 50.w,
                    child: Image.asset("assets/images/Conversion.png"),
                  ),
                ],
              ),
              Image.asset("assets/images/Dashboard.png"),
              Image.asset("assets/images/Cart.png"),
              Image.asset("assets/images/Revenue by device.png"),
              Image.asset("assets/images/Traffic.png"),
              Image.asset("assets/images/Bestsellers.png"),
              Image.asset("assets/images/Sales forecast.png"),
              Image.asset("assets/images/Latest Orders.png"),
            ],
          ),
        ),
      ),
    );
  }
}
