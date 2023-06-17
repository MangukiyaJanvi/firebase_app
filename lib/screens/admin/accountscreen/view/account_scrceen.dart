import 'package:firebase_app/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Your Account",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey.shade600),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(
                        width: 5.w,
                      ),
                      Icon(Icons.mail_outline),
                      SizedBox(
                        width: 5.w,
                      ),
                      Icon(Icons.notifications_none),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  (FbHelper.fbHelper.img != null)
                      ? CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage("${FbHelper.fbHelper.img}"),
                        )
                      : CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage("assets/images/me.jpg"),
                        ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (FbHelper.fbHelper.name!=null)?"${FbHelper.fbHelper.name}":"Janvi Mangukiya",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            "Verified Profile",
                            style: TextStyle(fontSize: 12.sp),
                          ),
                          Icon(Icons.navigate_next),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              height: 0.7.h,
              width: double.infinity,
              color: Colors.blueGrey.shade100,
            ),
            SizedBox(
              height: 1.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Transaction List",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: Colors.blueGrey.shade500),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                height: 7.h,
                                child: Image.asset(
                                  "assets/images/currency.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Text("Awaiting"),
                              Text("Payment"),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              Icon(
                                Icons.payment,
                                size: 30.sp,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text("Transaction"),
                              Text("in Progress"),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                height: 5.h,
                                child: Image.asset("assets/images/boxes.png",
                                    fit: BoxFit.fill),
                              ),
                              SizedBox(
                                height: 0.7.h,
                              ),
                              Text("All"),
                              Text("Transaction"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              height: 0.7.h,
              width: double.infinity,
              color: Colors.blueGrey.shade100,
            ),
            Box("Voucher"),
            Box("Reviews"),
            Box("Return"),
            SizedBox(
              height: 1.5.h,
            ),
            Center(
              child: Text(
                "Your Favorite",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    color: Colors.blueGrey.shade500),
              ),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Box("Favorite Topics"),
            Box("Wishlist"),
          ],
        ),
      ),
    );
  }

  Widget Box(String data) {
    return Column(
      children: [
        SizedBox(
          height: 1.h,
        ),
        ListTile(
          title: Text(data),
          trailing: Icon(Icons.navigate_next),
        ),
        Container(
          margin: EdgeInsets.only(left: 14),
          height: 0.3.h,
          width: double.infinity,
          color: Colors.black26,
        ),
      ],
    );
  }
}
