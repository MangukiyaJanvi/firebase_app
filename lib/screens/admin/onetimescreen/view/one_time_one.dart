import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class OneScreen extends StatefulWidget {
  const OneScreen({Key? key}) : super(key: key);

  @override
  State<OneScreen> createState() => _OneScreenState();
}

class _OneScreenState extends State<OneScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 100.h,
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  height: 5,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Image.asset('assets/images/welcome.png'),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.all(15),
                child: Text(
                  "we're glad that that\nyou are here",
                  style: TextStyle(
                      color: Color(0XFF739877),
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                height: 5.h,
                width: 50.w,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAndToNamed('/second');
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0XFF557A59))),
                  child: Text("Lets Get Started"),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 2,
                ),
              ),
              Container(
                child: Image.asset('assets/images/aloevera.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
