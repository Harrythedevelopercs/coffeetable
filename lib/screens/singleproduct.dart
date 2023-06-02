import 'package:fastfodd/controllers/firebaseController.dart';
import 'package:fastfodd/providers/appInformation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widegts/menu/top.dart';

class SingleProduct extends StatefulWidget {
   var recordObject;
   SingleProduct({Key? key ,  required this.recordObject}) : super(key: key);

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {


  @override
  Widget build(BuildContext context) {

    var results = FirebaseController.serachProductForSingleProduct(widget.recordObject);
    return Scaffold(
      backgroundColor: Appinformation.baseColor,
      body: FutureBuilder(
          future: results,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Container(
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
                                decoration:  BoxDecoration(
                                    color: Appinformation.secondaryColor,
                                    borderRadius:
                                    BorderRadius.vertical(top: Radius.circular(30.0))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 30,
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 300,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 150,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20),
                                                    border: Border.all(width: 2,
                                                        color: Appinformation.baseColor)
                                                ),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    CircleAvatar(
                                                      child: Text("S"),
                                                      backgroundColor: Appinformation.baseColor,
                                                    ),
                                                    CircleAvatar(
                                                      child: Text("M"),
                                                      backgroundColor: Appinformation.baseColor,
                                                    ),
                                                    CircleAvatar(
                                                      child: Text("L"),
                                                      backgroundColor: Appinformation.baseColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              RotatedBox(
                                                  quarterTurns: 3,
                                                  child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                                                      backgroundColor: Appinformation.baseColor,
                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                      padding: const EdgeInsets.only(top: 15,bottom: 15,left: 15,right: 15)
                                                  ), child: Text("ADD TO CART"),)
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                            width: MediaQuery.of(context).size.width * 0.7,
                                            height: 300,
                                            decoration: BoxDecoration(
                                                color: Colors.white70,
                                                borderRadius: BorderRadius.circular(20),
                                                border: Border.all(width: 2,
                                                    color: Appinformation.baseColor)
                                            ),
                                            child: Image(
                                              image: NetworkImage("${snapshot.data['image']}"),
                                              height: 200,
                                              width: 200,
                                            )
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children:[

                                          Text("${snapshot.data['title']}",style: GoogleFonts.rubik(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700
                                          ),),

                                          Container(
                                              color: Appinformation.baseColor,
                                              padding: EdgeInsets.only(left: 20,right: 20,bottom: 5,top: 5),
                                              child: Text("PKR 120",style: GoogleFonts.rubik(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white
                                              ),)
                                          )

                                        ]
                                    )

                                  ],
                                )
                            ))
                      ],
                    ),
                  );
            } else {
              return Center(child:CircularProgressIndicator(
                color: Appinformation.secondaryColor,
              ));
            }
          }),
    );


  }
}


checkdatabase(id) async {
  var results = await FirebaseController.serachProductForSingleProduct(id);
  return results;
}