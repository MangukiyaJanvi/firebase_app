import 'package:firebase_app/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';
import 'package:sizer/sizer.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
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
                          Get.offAndToNamed('/home');
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
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed('/signup');
                      },
                      child: Text(
                        "Create a New Account?",
                        style:
                            TextStyle(color: Colors.white70, fontSize: 18.sp),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: SignInButton(
                      buttonType: ButtonType.google,
                      onPressed: () async {
                        String? msg =
                            await FbHelper.fbHelper.signInWithGoogle();
                        if (msg == "Success") {
                          Get.offAndToNamed('/home');
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
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
