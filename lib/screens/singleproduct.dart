import 'package:fastfodd/controllers/firebaseController.dart';
import 'package:fastfodd/providers/appInformation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widegts/menu/top.dart';

class SingleProduct extends StatefulWidget {
  var recordObject;
  SingleProduct({Key? key, required this.recordObject}) : super(key: key);

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  int price = 0;
  double image_size_w = 200;
  double image_size_h = 200;
  int quantity = 1;

  var size = "s";


  @override
  Widget build(BuildContext context) {
    var results =
        FirebaseController.serachProductForSingleProduct(widget.recordObject);

    return Scaffold(
      backgroundColor: Appinformation.baseColor,
      body: FutureBuilder(
          future: results,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              price = snapshot
                  .data['small_price'];
              int total = quantity * price;
              return SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Appinformation.baseColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: TopArea(context),
                      ),
                      Container(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Appinformation.secondaryColor,
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(30.0))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 300,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 150,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  width: 2,
                                                  color: Appinformation
                                                      .baseColor)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              GestureDetector(
                                                child: CircleAvatar(
                                                  child: Text(
                                                    "S",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  backgroundColor:
                                                      Appinformation
                                                          .baseColor,
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    price = snapshot
                                                        .data['small_price'];
                                                    image_size_w = 100;
                                                    image_size_h = 100;
                                                    size = "s";
                                                  });
                                                },
                                              ),
                                              GestureDetector(
                                                child: CircleAvatar(
                                                  child: Text(
                                                    "M",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  backgroundColor:
                                                      Appinformation
                                                          .baseColor,
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    price = snapshot
                                                        .data['med_price'];
                                                    image_size_w = 150;
                                                    image_size_h = 150;
                                                     size = "m";
                                                  });
                                                },
                                              ),
                                              GestureDetector(
                                                child: CircleAvatar(
                                                  child: Text(
                                                    "L",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  backgroundColor:
                                                      Appinformation
                                                          .baseColor,
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    price = snapshot
                                                        .data['large_price'];
                                                    image_size_w = 200;
                                                    image_size_h = 200;
                                                    size = "l";
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        RotatedBox(
                                            quarterTurns: 3,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                String title = snapshot.data['title'];

                                                  var result =  FirebaseController.addtoCartFire(title,quantity,size,total);
                                                  print(result);


                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Appinformation
                                                          .baseColor,
                                                  shape:
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 15,
                                                          bottom: 15,
                                                          left: 15,
                                                          right: 15)),
                                              child: Text("ADD TO CART"),
                                            )),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      width:
                                          MediaQuery.of(context).size.width *
                                              0.7,
                                      height: 300,
                                      decoration: BoxDecoration(
                                          color: Colors.white70,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                              width: 2,
                                              color:
                                                  Appinformation.baseColor)),
                                      child: Image(
                                        image: NetworkImage(
                                            "${snapshot.data['image']}"),
                                        height: image_size_w,
                                        width: image_size_h,
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${snapshot.data['title']}",
                                      style: GoogleFonts.rubik(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Container(
                                        color: Appinformation.baseColor,
                                        padding: EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            bottom: 5,
                                            top: 5),
                                        child: Text(
                                          "PKR ${(price != 0) ? price : price = snapshot.data['small_price']}",
                                          style: GoogleFonts.rubik(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ))
                                  ]),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                width: 400,
                                height: 50,
                                padding: EdgeInsets.only(left: 2, right: 2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      child: CircleAvatar(
                                        backgroundColor:
                                            Appinformation.baseColor,
                                        child: const Text("-"),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          if (quantity > 1) {
                                            --quantity;
                                          }
                                        });
                                      },
                                    ),
                                    Text(
                                      "${quantity}",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    GestureDetector(
                                      child: CircleAvatar(
                                        backgroundColor:
                                            Appinformation.baseColor,
                                        child: const Text("+"),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          ++quantity;
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text("PKR ${quantity * price}",
                                  style: GoogleFonts.rubik(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700)),
                              const SizedBox(
                                height: 15,
                              ),
                               TextField(
                                maxLines: 3, //or null
                                decoration: InputDecoration(
                                  label: Text("Comments",style: TextStyle(
                                    color: Appinformation.baseColor
                                  )),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 105,
                              ),
                            ],

                          ))
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                  child: CircularProgressIndicator(
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
