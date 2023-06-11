import 'dart:async';

import 'package:firebase_app/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    isLogin = FbHelper.fbHelper.checkUser();
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3),
        () => Get.offAndToNamed(
            isLogin ? '/home' :
            '/one'));
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
