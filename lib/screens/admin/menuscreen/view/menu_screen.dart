import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../main.dart';
import '../model/menu_model.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed('/add', arguments: {"code": 1});
          },
          backgroundColor: Color(0XFF0F4C36),
          child: Icon(Icons.add),
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

              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.6,
                          crossAxisSpacing: 0.6),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Get.dialog(
                            AlertDialog(
                              title: Text("Are you Sure to Delete ${list[index].name}'s Details?"),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                      Color(0XFF0F4C36),
                                    ),
                                  ),
                                  child: Text("Cancle"),
                                ),
                                SizedBox(
                                  width: 28.w,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    FbHelper.fbHelper
                                        .deleteData(list[index].key!);
                                    Get.back();
                                  },
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Color(0XFF0F4C36))),
                                  child: Text("Delete"),
                                ),
                              ],
                            ),
                          );
                        },
                        onLongPress: () {
                          MenuModel model = list[index];
                          Get.toNamed('/add',
                              arguments: {"code": 0, "model": model});
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
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                      ],
                                    ),
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
                ],
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
}
