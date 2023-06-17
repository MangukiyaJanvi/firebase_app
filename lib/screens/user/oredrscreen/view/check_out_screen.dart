import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/screens/user/oredrscreen/model/oreder_model.dart';
import 'package:firebase_app/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../../main.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: StreamBuilder(
          stream: FbHelper.fbHelper.readBuyProduct(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              QuerySnapshot? querySnapshot = snapshot.data;
              orderList.clear();
              for (var x in querySnapshot!.docs) {
                Map data = x.data() as Map;
                String name = '${data['name']}';
                String price = '${data['price']}';
                String image = '${data['image']}';
                String discription = '${data['discription']}';
                var key = x.id;
                OrderModel m1 = OrderModel(
                    name: name,
                    image: image,
                    price: price,
                    key: key,
                    discription: discription);
                orderList.add(m1);
                print(orderList);
              }
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("CheckOut Your Order",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold)),
                          IconButton(
                            onPressed: () {
                              Get.dialog(AlertDialog(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                content: Lottie.asset(
                                    "assets/json/79952-successful.json", width: 100,height: 100),
                              ));
                            },
                            icon: Icon(Icons.done_outline,
                                color: Colors.green.shade800),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 16.h,
                      child: ListView.builder(
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: 10.h,
                                    color: Colors.red,
                                    width: 25.w,
                                    child: Image.network(
                                        "${orderList[index].image}",
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${orderList[index].name}",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "₹${orderList[index].price}",
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          color: Colors.green.shade700),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        itemCount: orderList.length,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 79.h,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Gift card and discount code',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                            color: Colors.blueGrey.shade800,
                                            width: 1.5),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '10% off on orders above ₹1499',
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            color: Colors.green.shade800),
                                      ),
                                      Text('APPLY OFFER'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '15% off on orders above ₹2999',
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            color: Colors.green.shade800),
                                      ),
                                      Text('APPLY OFFER'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Box(),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('SubTotal'),
                                Text(
                                  (orderList[0].price == null)
                                      ? "₹0.00"
                                      : '₹${orderList[0].price}.00',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Shipping'),
                                Text('Calculated at next step'),
                              ],
                            ),
                          ),
                          Box(),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total'),
                                Text(
                                  (orderList[0].price == null)
                                      ? "INR ₹0.00"
                                      : 'INR ₹${orderList[0].price}.00',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '300,000 HAPPY CUSTOMERS TRUST US!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15.sp),
                            ),
                          ),
                          Terms('Guaranteed Returns',
                              'Assured replacements if your plant arrives damaged or dies within the first 15 days'),
                          Terms('Healthy & Premium Looking Plants',
                              'We grow & nurture all our plants with love for 6 months before sending them to you.'),
                          Terms('Our Plants Grow Everywhere',
                              'We deliver all over the country.'),
                          Terms('Growing the Grower',
                              'We have been growing plants for over 30 years and understand the science (and emotions) behind it. We will guide you through your plant journey.'),
                        ],
                      ),
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

  Widget Box() {
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        Container(height: 0.8.h, color: Colors.grey.shade200),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Widget Terms(String data, String about) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.double_arrow_rounded),
              Text(
                data,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 50,
              ),
              Container(
                width: 80.w,
                child: Text(
                  about,
                  style: TextStyle(
                      wordSpacing: 1, letterSpacing: 1, fontSize: 15.sp),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
