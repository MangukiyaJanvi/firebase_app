import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class UserSplashScreen extends StatelessWidget {
  const UserSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () => Get.offAndToNamed('/userhome'));
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Color(0XFF447055),
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "GO",
                style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                "GREEN",
                style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade100),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
