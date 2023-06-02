import 'package:fastfodd/screens/addproducts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../providers/appInformation.dart';
import '../widegts/menu/top.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: Appinformation.baseColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TopArea(context),
              ),
              Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30.0))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text("Time For Coffee",style: GoogleFonts.rubik(
                          fontSize: 18,
                          color: Appinformation.baseColor,
                            fontWeight: FontWeight.w600
                        ),),
                        const SizedBox(
                          height: 10,
                        ),
                       AddProductScreen(),
                      ],
                    )
              ))
            ],
          ),
        ));
  }
}
