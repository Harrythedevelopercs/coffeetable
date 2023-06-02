import 'package:fastfodd/screens/addproducts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/firebaseController.dart';
import '../../providers/appInformation.dart';


TopArea(context){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello",
            style: GoogleFonts.rubik(
                fontSize: 28, color: Colors.grey.withOpacity(0.8)),
          ),
          Text(
            "${getUserName()}",
            style: GoogleFonts.rubik(
                fontSize: 28, color: Colors.white.withOpacity(0.8)),),
        ],
      ),
      CircleAvatar(
        backgroundColor: Appinformation.secondaryColor,
        child: PopupMenuButton(
          icon:  Icon(
            Icons.menu,
            color: Appinformation.baseColor,
          ),
          splashRadius: 20,
          onSelected: (value){
            if(value == 2){
              FirebaseController.firebaseLogout(context);
            }
          },
          itemBuilder: (context) {
            return [
              const PopupMenuItem(
                value: 0,
                child: Text("Profile"),
              ),
              const PopupMenuItem(
                value: 1,
                child: Text("Settings"),
              ),
              const PopupMenuItem(
                value: 3,
                child: Text("Cart"),
              ),
              const PopupMenuItem(
                value: 5,
                child: Text("Orders"),
              ),
              const PopupMenuItem(
                value: 2,
                child: Text("Logout"),
              )
            ];
          },
        )
      )
    ],
  );
}

getUserName() {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    final name = user.displayName;
    return (name != null) ? name : "New User" ;
  }
}
