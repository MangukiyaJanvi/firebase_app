import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class OneThirdScreen extends StatefulWidget {
  const OneThirdScreen({Key? key}) : super(key: key);

  @override
  State<OneThirdScreen> createState() => _OneThirdScreenState();
}

class _OneThirdScreenState extends State<OneThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: 100.h,
          child: Column(
            children: [
              Image.asset('assets/images/image 3.png'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                    'assets/images/Connect With Other Plant Lovers.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Container(
                    height: 9.h,
                    width: 70.w,
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/Join A Community.jpg')),
              ),
              Expanded(
                child: SizedBox(
                  height: 5,
                ),
              ),
              Container(
                height: 5.h,
                width: 70.w,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAndToNamed('/loginadmin');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color(0XFF557A59),
                    ),
                  ),
                  child: Text(
                    "Want to Sell Product?",
                    style: TextStyle(fontSize: 15.sp),
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Container(
                height: 5.h,
                width: 70.w,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAndToNamed('/signin');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color(0XFF557A59),
                    ),
                  ),
                  child: Text(
                    "Want to Buy Product?",
                    style: TextStyle(fontSize: 15.sp),
                  ),
                ),
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
