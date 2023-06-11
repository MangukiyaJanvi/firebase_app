import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/utils/smart_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../main.dart';
import '../../../utils/firebase_helper.dart';
import '../../admin/menuscreen/model/menu_model.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Color(0XFF0F4C36),
          title: Row(
            children: [
              Text(
                "GO",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                "GREEN",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.green.shade100),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed('/cart');
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.lightGreen.shade900,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.green.shade50,
                      backgroundImage: NetworkImage("${FbHelper.fbHelper.img}"),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${FbHelper.fbHelper.name}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.sp),
                    ),
                    Text(
                      "${FbHelper.fbHelper.email}",
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.lightGreen.shade50,
                child: Column(
                  children: [
                    Box(Icons.home, "Home"),
                    Box(Icons.notifications, "Notifications"),
                    Box(Icons.mail_lock, "Inbox"),
                    Box(Icons.person, "Account"),
                    Box(Icons.info, "Info"),
                    Box(Icons.settings, "Settings"),
                    InkWell(onTap: () {
                      FbHelper.fbHelper.signOut();
                    },child: Box(Icons.logout, "LogOut")),
                    Box(Icons.help, "Help"),
                    ListTile(
                      onTap: () {
                        Get.offAllNamed('/');
                      },
                      leading: Container(
                        width: 8.w,
                        child: Image.asset('assets/images/admin.png'),
                      ),
                      title: Text('Admin Side'),
                      trailing: Icon(Icons.navigate_next),
                    ),
                    ListTile(
                      leading: Container(
                        width: 8.w,
                        child: Image.asset('assets/images/people.png'),
                      ),
                      title: Text('User Side'),
                      trailing: Icon(Icons.navigate_next),
                    ),
                    Container(
                      height: 5.h,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        body: StreamBuilder(
          stream: FbHelper.fbHelper.readProduct(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else if (snapshot.hasData) {
              QuerySnapshot? querySnapshot = snapshot.data;
              list.clear();
              for (var x in querySnapshot!.docs) {
                Map data = x.data() as Map;
                String name = '${data['name']}';
                String price = '${data['price']}';
                String image = '${data['image']}';
                String discription = '${data['discription']}';
                var key = x.id;
                MenuModel m1 = MenuModel(
                    name: name,
                    image: image,
                    price: price,
                    key: key,
                    discription: discription);
                list.add(m1);
              }
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/images/Banner.png"),
                    ),
                    SizedBox(
                      height: 35.h,
                      child: Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Get.toNamed('/data', arguments: index);
                            },
                            child: Container(
                              height: 50.h,
                              width: 45.w,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                    ),
                                    child: SizedBox(
                                      height: 15.h,
                                      width: double.infinity,
                                      child: Image.network(
                                        "${list[index].image}",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "\n${list[index].name}",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        BoxRate(),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          "From ₹${list[index].price}",
                                          style: TextStyle(
                                              color: Color(0XFF519453),
                                              fontSize: 13.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          itemCount: list.length,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100.h,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.6,
                            crossAxisSpacing: 0.6),
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Get.toNamed('/data', arguments: index);
                          },
                          child: InkWell(
                            onTap: () {
                              Get.toNamed('/data', arguments: index);
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                    ),
                                    child: SizedBox(
                                      height: 20.h,
                                      width: double.infinity,
                                      child: Image.network(
                                        "${list[index].image}",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "\n${list[index].name}",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        BoxRate(),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          "From ₹${list[index].price}",
                                          style: TextStyle(
                                              color: Color(0XFF519453),
                                              fontSize: 13.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        itemCount: list.length,
                      ),
                    ),
                  ],
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Widget Box(IconData icon, String data) {
    return ListTile(
      leading: Icon(icon),
      title: Text(data),
      trailing: Icon(Icons.navigate_next),
    );
  }
}
