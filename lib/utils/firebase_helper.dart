import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../screens/admin/menuscreen/model/menu_model.dart';
import 'notification_service.dart';

class FbHelper {
  static FbHelper fbHelper = FbHelper._();

  FbHelper._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //TODO login
  Future<String> signUp({required email, required password}) {
    return firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      return "Success";
    }).catchError((e) {
      return "$e";
    });
  }

  Future<String> signIn({required email, required password}) {
    return firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      return "Success";
    }).catchError((e) {
      return "$e";
    });
  }

  bool checkUser() {
    User? user = firebaseAuth.currentUser;
    return user != null;
  }

  Future<String?> signInWithGoogle() async {
    String? msg;
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) => msg = "Success")
        .catchError((e) => msg = "$e");
    return msg;
  }

  String? email, name, img;

  void getemial() {
    User? user = firebaseAuth.currentUser;
    email = user!.email;
    name = user.displayName;
    img = user.photoURL;
  }

  //TODO add data

  void addProduct({name, image, price, discription}) {
    firestore.collection("Products").add({
      "name": name,
      "image": image,
      "price": price,
      "discription": discription
    });
  }
  void addtoCart({name, image, price, discription}) {
    firestore.collection("cart").add({
      "name": name,
      "image": image,
      "price": price,
      "discription": discription
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readProduct() {
    User? user = firebaseAuth.currentUser;
    var uid = user!.uid;
    return firestore.collection('Products').snapshots();
  }
  Stream<QuerySnapshot<Map<String, dynamic>>> readCartProduct() {
    User? user = firebaseAuth.currentUser;
    var uid = user!.uid;
    return firestore.collection('cart').snapshots();
  }

  Future<void> deleteData(String key) async {
    await firestore.collection('Products').doc(key).delete();
  }

  Future<void> updateData(MenuModel m1) async {
    await firestore
        .collection('Products')
        .doc(m1.key)
        .update({"name": m1.name, "image": m1.image, "price": m1.price});
  }

  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initFirebaseMsG() async {
    var fcmToken = await firebaseMessaging.getToken();
    print("Token :$fcmToken=======================");
    await firebaseMessaging.setAutoInitEnabled(true);
    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    FirebaseMessaging.onMessage.listen((event) {
      if (event.notification != null) {
        String? title = event.notification!.title;
        String? body = event.notification!.body;

        NotificationServise.notificationServise
            .showFirebaseNotification(title, body!);
      }
    });
  }
  Future<void> signOut() async {
    await firebaseAuth.signOut().then((value) => Get.offAndToNamed('/'));
  }
}
