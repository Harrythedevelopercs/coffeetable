import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../screens/home.dart';
import '../screens/login.dart';
import '../screens/menu.dart';

class FirebaseController {


  static getallProducts() async {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');
     return products.get();
  }

  static firebaseRegistration(
      String clientEmail, String clientPassword, context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: clientEmail,
        password: clientPassword,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
      return 0;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showMyDialogwhenregisterisgivenerror(
            context, 'Warning', 'The password provided is too weak.');
        return 1;
      } else if (e.code == 'email-already-in-use') {
        showMyDialogwhenregisterisgivenerror(
            context, 'Warning', 'email already in use');
        return 1;
      }
    } catch (e) {
      return "CONTACT DEVELOPER REGISTER CONTROLLER";
    }
  }

  static firebaseLogout(context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  static firebaseLogin(String emailAddress, String password, context) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MenuScreen()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showMyDialogwhenregisterisgivenerror(
            context, 'Warning', 'No user found for that email.');
        return 1;
      } else if (e.code == 'wrong-password') {
        showMyDialogwhenregisterisgivenerror(
            context, 'Warning', 'Wrong password provided for that user.');
        return 1;
      }
    }
  }

  static serachProductForSingleProduct(id) {
      return FirebaseFirestore.instance
        .collection('products')
        .doc(id)
        .get();
  }

  static showMyDialogwhenregisterisgivenerror(
      context, String title, String errorMessage) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${title}'),
          content: Text("${errorMessage}"),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
