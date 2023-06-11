import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_app/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../main.dart';
import '../../../../utils/smart_widget.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  int index = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Image.network("${list[index].image}"),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Center(
                    child: Text(
                      'About the Plant',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "${list[index].discription}",
                    style: TextStyle(
                        fontSize: 15.sp,
                        wordSpacing: 1.sp,
                        letterSpacing: 1.sp),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 5.h,
                        child: Image.network(
                            "https://cdn.shopify.com/s/files/1/0579/7924/0580/files/Sunlight-2_2x_c2ce9dfa-edf9-4a1d-94fa-4e01e6baea45_small.png?v=1656923265"),
                      ),
                      Text(
                        "Needs Bright Indirect Sunlight",
                        style: TextStyle(fontSize: 15.sp),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 83.w,
                      child: Text(
                          'Place your plants on window sills where it can get the brightest possible indirect light. Bright indirect light is when the plant is within a couple of feet of a natural source of light.'),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 5.h,
                        child: Image.network(
                            "https://cdn.shopify.com/s/files/1/0579/7924/0580/files/Water-2_2x_e01f383f-4647-47cf-a82f-31ff906cf3f3_small.png?v=1656923200"),
                      ),
                      Text(
                        "Water Once A Week",
                        style: TextStyle(fontSize: 15.sp),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 83.w,
                      child: Text(
                          'Always check your plants before watering, the topsoil should be dry to touch. For succulents allow the potting mix to dry completely before watering again.'),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 5.h,
                        child: Image.network(
                            "https://cdn.shopify.com/s/files/1/0579/7924/0580/files/Maintainance-1_2x_809fc5b5-c212-4f22-803b-50241e478b2f_small.png?v=1656923507"),
                      ),
                      Text(
                        "Needs Gardening Experience",
                        style: TextStyle(fontSize: 15.sp),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 83.w,
                      child: Text(
                          'The plant needs a knowing eye of a gardener to understand what it needs. Fairly easy to grow if you take care of their set of requirements.'),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 5.h,
                        child: Image.network(
                            'https://cdn.shopify.com/s/files/1/0579/7924/0580/files/Animal_2_2x_7abd45ab-b3e1-4d66-939f-1c1a4db5672d_small.png?v=1656923522'),
                      ),
                      Text(
                        "Toxic To Pets",
                        style: TextStyle(fontSize: 15.sp),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 83.w,
                      child: Text(
                          'The plant can cause anything from irritation to fatal damage to your pets on contact or ingestion. Prolonged exposure can result in long term side effects and death.'),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.dialog(
                        AlertDialog(
                          backgroundColor: Colors.transparent,
                          icon: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(Icons.clear, color: Colors.white),
                          ),
                          content: RotatedBox(
                            quarterTurns: 1,
                            child: Container(
                              height: 20.h,
                              width: double.infinity,
                              child: Image.network(
                                  "https://cdn.shopify.com/s/files/1/0579/7924/0580/files/Plant_Light_Guide_For_Website_6.09_F.png?v=1662474072s",
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'VIEW LIGHT GUIDE',
                      style: TextStyle(color: Colors.black54, fontSize: 13.sp),
                    ),
                  ),
                  Box('https://cdn.shopify.com/s/files/1/0579/7924/0580/files/shipping_25798584-6184-42f8-b1d1-d9728a83ef84.png?v=1676873379',
                      "Free Shipping above ₹499"),
                  Box('https://cdn.shopify.com/s/files/1/0579/7924/0580/files/GuaranteedReturn.png?v=1676873444',
                      "Guaranteed Replacements if Damaged"),
                  Box('https://cdn.shopify.com/s/files/1/0579/7924/0580/files/expertguidence.png?v=1676873472',
                      "Expert Guidance"),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "${list[index].name}",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
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
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF519453),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    height: 5.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        String name = "${list[index].name}";
                        String image = "${list[index].image}";
                        String price = "${list[index].price}";
                        String discription = "${list[index].discription}";
                        FbHelper.fbHelper.addtoCart(
                            discription: discription,
                            image: image,
                            name: name,
                            price: price);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Color(0XFF149253),
                        ),
                      ),
                      child: Text("Add To Cart"),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Center(
                    child: Text(
                      'From Happy Plant Parents',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  CarouselSlider.builder(
                    itemCount: 3,
                    itemBuilder: (context, index, realIndex) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Text(
                          "${listComment[index]}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.sp,
                              letterSpacing: 1.sp,
                              wordSpacing: 1.5.sp),
                        ),
                      ),
                    ),
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Box(String image, String data) {
    return Row(
      children: [
        Image.network(image),
        Container(
          width: 65.w,
          child: Text(
            data,
            style: TextStyle(fontSize: 14.sp),
          ),
        ),
      ],
    );
  }

  Widget Box2(String image, String data) {
    return Row(
      children: [
        Container(
          height: 5.h,
          child: Image.network(
              "https://cdn.shopify.com/s/files/1/0579/7924/0580/files/Sunlight-2_2x_c2ce9dfa-edf9-4a1d-94fa-4e01e6baea45_small.png?v=1656923265"),
        ),
        Text(
          "Needs Bright Indirect Sunlight",
          style: TextStyle(fontSize: 15.sp),
        ),
      ],
    );
  }
}
