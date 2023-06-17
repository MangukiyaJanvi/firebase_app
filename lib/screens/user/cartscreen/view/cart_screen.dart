import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/main.dart';
import 'package:firebase_app/screens/user/cartscreen/controller/cart_controller.dart';
import 'package:firebase_app/screens/user/cartscreen/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../utils/firebase_helper.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0XFF0F4C36),
          title: const Text('Cart Screen'),
        ),
        body: StreamBuilder(
          stream: FbHelper.fbHelper.readCartProduct(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else if (snapshot.hasData) {
              QuerySnapshot? querySnapshot = snapshot.data;
              cartList.clear();
              for (var x in querySnapshot!.docs) {
                Map data = x.data() as Map;
                String name = '${data['name']}';
                String price = '${data['price']}';
                String image = '${data['image']}';
                String discription = '${data['discription']}';
                var key = x.id;
                CartModel m1 = CartModel(
                    name: name,
                    image: image,
                    price: price,
                    key: key,
                    discription: discription);
                cartList.add(m1);
              }

              return SizedBox(
                height: 100.h,
                child: Column(
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      'Free Shipping above ₹499\nAll India Delivery',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) =>
                            GestureDetector(
                              onTap: () {
                                // Get.toNamed('/data',arguments: index);
                              },
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: SizedBox(
                                        // height: 15.h,
                                        width: 40.w,
                                        child: Image.network(
                                          "${cartList[index].image}",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                      child: SizedBox(
                                        width: 54.w,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "\n${cartList[index].name}",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14.sp),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Text(
                                              'Select Plant Size:Small',
                                              style: TextStyle(
                                                  color: Colors.grey.shade700),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Text(
                                              'Select Planter:GroPot',
                                              style: TextStyle(
                                                  color: Colors.grey.shade700),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Text(
                                              'Color:Ivory',
                                              style: TextStyle(
                                                  color: Colors.grey.shade700),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {
                                                        if (controller.i.value >
                                                            1) {
                                                          controller.i.value -=
                                                          1;
                                                          print(controller.i
                                                              .value);
                                                        }
                                                      },
                                                      icon: Icon(Icons.remove,
                                                          size: 20),
                                                    ),
                                                    Obx(() =>
                                                        Text(
                                                            '${controller.i
                                                                .value}')),
                                                    IconButton(
                                                      onPressed: () {
                                                        controller.i.value += 1;
                                                        print(controller.i
                                                            .value);
                                                      },
                                                      icon:
                                                      Icon(Icons.add, size: 20),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  "₹${cartList[index].price}",
                                                  style: TextStyle(
                                                      color:
                                                      const Color(0XFF519453),
                                                      fontSize: 13.sp),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        itemCount: cartList.length,
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      'Discount codes can be used at checkout',
                      style: TextStyle(fontSize: 15.sp),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.amber,
                      padding: EdgeInsets.all(5),
                      child: Text(
                          'FREE REPLACEMENT IF YOU RECEIVE DAMAGED PLANTS',
                          style: TextStyle(fontSize: 17.sp),
                          textAlign: TextAlign.center),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      height: 5.h,
                      width: 50.w,
                      child: ElevatedButton(
                        onPressed: () {
                          for (int i = 0; i < cartList.length; i++) {
                            Map<String,dynamic> m1 = {
                              "name": "${cartList[i].name}",
                              "image": "${cartList[i].image}",
                              "price": "${cartList[i].price}",
                              "discription": "${cartList[i].discription}"
                            };
                            FbHelper.fbHelper.addtoBuy(m1);
                            Get.toNamed('/order');
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Color(0XFF149253),
                          ),
                        ),
                        child: Text(
                          "Check Out",
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
