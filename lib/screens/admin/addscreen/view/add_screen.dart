import 'package:firebase_app/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../menuscreen/model/menu_model.dart';
import '../controller/add_controller.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtprice = TextEditingController();
  TextEditingController txtdesc = TextEditingController();
  TextEditingController txtimage = TextEditingController();
  AddController controller = Get.put(AddController());
  Map m1 = {};

  @override
  void initState() {
    super.initState();
    m1 = Get.arguments;
    if (m1['code'] == 0) {
      txtname = TextEditingController(text: m1['model'].name);
      txtprice = TextEditingController(text: m1['model'].price);
      txtdesc = TextEditingController(text: m1['model'].discription);
      txtimage = TextEditingController(text: m1['model'].image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0XFF0F4C36),
          title: Text((m1['code'] == 1) ? "Add Data" : "Update Data"),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.clear),
          ),
          actions: [
            IconButton(
              onPressed: () {
                if (m1['code'] == 0) {
                  String name = txtname.text;
                  String discription = txtdesc.text;
                  String price = txtprice.text;
                  String image = txtimage.text;
                  MenuModel m = MenuModel(
                      key: "${m1['model'].key}",
                      image: image,
                      price: price,
                      discription: discription,
                      name: name);

                  FbHelper.fbHelper.updateData(m);
                } else {
                  String name = txtname.text;
                  String discription = txtdesc.text;
                  String price = txtprice.text;
                  FbHelper.fbHelper.addProduct(
                      name: name, price: price, discription: discription);
                }
                Get.back();
              },
              icon: Icon(Icons.done),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Text(
                "Enter Plant Name",
                style: TextStyle(fontSize: 15.sp),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: txtname,
                cursorColor: Colors.blueGrey.shade800,
                textCapitalization: TextCapitalization.words,
                decoration: Box(hint: "Enter Plant Name"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter Plant Price",
                style: TextStyle(fontSize: 15.sp),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: txtprice,
                cursorColor: Colors.blueGrey.shade800,
                keyboardType: TextInputType.number,
                decoration: Box(hint: "Enter Plant Price"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter Description",
                style: TextStyle(fontSize: 15.sp),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 20.h,
                child: TextFormField(
                  controller: txtdesc,
                  cursorColor: Colors.blueGrey.shade800,
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: 100,
                  decoration: Box(hint: "Enter Description"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter Plant ImageUrl",
                style: TextStyle(fontSize: 15.sp),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: txtimage,
                cursorColor: Colors.blueGrey.shade800,
                keyboardType: TextInputType.number,
                decoration: Box(hint: "Enter Plant ImageUrl"),
              ),
              SizedBox(
                height: 5,
              ),
              (txtimage.text != null)
                  ? Image.network('${txtimage.text}')
                  : Image.asset('assets/images/picture.jpg'),
              SizedBox(
                height: 10,
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
