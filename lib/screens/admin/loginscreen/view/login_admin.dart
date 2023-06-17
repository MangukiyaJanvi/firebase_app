import 'package:firebase_app/utils/firebase_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LoginAdminAcreen extends StatefulWidget {
  const LoginAdminAcreen({Key? key}) : super(key: key);

  @override
  State<LoginAdminAcreen> createState() => _LoginAdminAcreenState();
}

class _LoginAdminAcreenState extends State<LoginAdminAcreen> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: -10,
              left: -10,
              right: -10,
              child: Container(
                height: 100.h,
                width: 100.w,
                child: Image.asset(
                  'assets/images/download (1).jpeg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Enter Email',
                    style: TextStyle(color: Colors.white70, fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(5),
                    child: TextFormField(
                      cursorColor: Colors.white,
                      controller: txtemail,
                      decoration: InputDecoration(
                        fillColor: Colors.white24,
                        filled: true,
                        icon: Icon(Icons.mail, color: Colors.white),
                        hintText: "Enter Email",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Enter Password',
                    style: TextStyle(color: Colors.white70, fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      cursorColor: Colors.white,
                      controller: txtpassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.white24,
                        filled: true,
                        icon: Icon(
                          Icons.key_outlined,
                          color: Colors.white,
                        ),
                        hintText: "Enter Password",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () async {
                        String msg = await FbHelper.fbHelper.signIn(
                            email: txtemail.text, password: txtpassword.text);
                        if (msg == "Success") {
                          if(txtemail.text=='admin123@gmail.com')
                            {
                              Get.offAndToNamed('/adminDetail');
                            }
                        }
                      },
                      child: Container(
                        width: 60.w,
                        height: 5.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          "LogIn",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
