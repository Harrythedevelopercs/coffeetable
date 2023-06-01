import 'package:fastfodd/controllers/firebaseController.dart';
import 'package:fastfodd/providers/appInformation.dart';
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
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data.docs[index]['name']),
                    subtitle: Text(snapshot.data.docs[index]['price']),
                  );
                });
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}

categoryMenu(String title, String image) {
  return Container(
    width: 165,
    height: 159,
    decoration: BoxDecoration(
        color: const Color(0xffF6F4EE),
        borderRadius: BorderRadius.circular(20)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage('${image}'),
          width: 150,
          height: 50,
        ),
        SizedBox(height: 10),
        Text(
          "${title}",
          style:
              GoogleFonts.rubik(fontSize: 18, color: Appinformation.baseColor),
        )
      ],
    ),
  );
}
