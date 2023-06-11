import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class OneSecondScreen extends StatefulWidget {
  const OneSecondScreen({Key? key}) : super(key: key);

  @override
  State<OneSecondScreen> createState() => _OneSecondScreenState();
}

class _OneSecondScreenState extends State<OneSecondScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
                top: 115,
                left: -30,
                child: Image.asset('assets/images/plants.png')),
            Positioned(
                top: 115,
                right: -10,
                child: Image.asset('assets/images/plants.png')),
            Column(
              children: [
                SizedBox(height: 5.h),
                Text(
                  'Discover Your Type\nOf Plant',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 28.sp,
                      color: Color(0XFF739877),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.h),
                Text(
                  'Tips N Tricks to grow a\nhealthy plant',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Color(0XFF739877),
                  ),
                ),
                SizedBox(height: 5.h),
                Container(
                  height: 5.h,
                  width: 40.w,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offAndToNamed('/third');
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Color(0XFF557A59),
                      ),
                    ),
                    child: Text("Continue"),
                  ),
                ),
                Expanded(
                    child: SizedBox(
                  height: 10,
                )),
                Image.asset('assets/images/plants.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
