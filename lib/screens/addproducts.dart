import 'package:fastfodd/controllers/firebaseController.dart';
import 'package:fastfodd/providers/appInformation.dart';
import 'package:fastfodd/screens/singleproduct.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    var results = FirebaseController.getallProducts();
    return FutureBuilder(
        future: results,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.7,
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  SingleProduct( recordObject: snapshot.data.docs[index].id,)),
                        );

                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xffF6F4EE),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: NetworkImage(
                                  snapshot.data.docs[index]['image']),
                              width: 100,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(snapshot.data.docs[index]['title'],
                                style: GoogleFonts.rubik(
                                    fontSize: 14, color: Colors.black))
                          ],
                        ),
                      ),
                    );
                  }),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
