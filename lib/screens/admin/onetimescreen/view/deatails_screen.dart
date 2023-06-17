import 'package:firebase_app/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtmobile = TextEditingController();
  TextEditingController txtadd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0XFF0F4C36),
          title: Text('Add Your Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Text(
                "Enter Your Name",
                style: TextStyle(fontSize: 15.sp),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: txtname,
                cursorColor: Colors.blueGrey.shade800,
                textCapitalization: TextCapitalization.words,
                decoration: Box(hint: "Enter Your Name"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter Your Mobile Number",
                style: TextStyle(fontSize: 15.sp),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: txtmobile,
                cursorColor: Colors.blueGrey.shade800,
                keyboardType: TextInputType.number,
                decoration: Box(hint: "Enter Your Number"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter Your Address",
                style: TextStyle(fontSize: 15.sp),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 12.h,
                child: TextFormField(
                  controller: txtadd,
                  cursorColor: Colors.blueGrey.shade800,
                  keyboardType: TextInputType.multiline,
                  textCapitalization: TextCapitalization.words,
                  maxLines: 10,
                  decoration: Box(hint: "Enter Your Address"),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 5.h,
                width: 70.w,
                child: ElevatedButton(
                  onPressed: () {
                    FbHelper.fbHelper.addUserDetails(
                        name: txtname.text,
                        add: txtadd.text,
                        mobile: txtmobile.text);
                    Get.offAndToNamed('/userhome');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color(0XFF0F4C36),
                    ),
                  ),
                  child: Text(
                    'Continue to Login',
                    style: TextStyle(fontSize: 17.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration Box({String? hint}) {
    return InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.blueGrey.shade800, width: 1.5),
      ),
    );
  }
}
