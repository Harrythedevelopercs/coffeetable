import 'package:fastfodd/providers/appInformation.dart';
import 'package:fastfodd/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/firebaseController.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController userEmail =  TextEditingController();
  TextEditingController userPassword =  TextEditingController();

  var _buttonMessage = "Create Account";



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Appinformation.secondaryColor,
      body: Container(
        padding: EdgeInsets.only(right: 40, left: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello",
              style: GoogleFonts.rubik(
                textStyle: TextStyle(
                    color: Appinformation.baseColor,
                    letterSpacing: .5,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Text(
              "Let's Setup Your Account its Take 1 Min Just",
              style: GoogleFonts.rubik(
                textStyle: TextStyle(
                    color: Appinformation.baseColor,
                    letterSpacing: .5,
                    fontSize: 13,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
                controller: userEmail,
                decoration: InputDecoration(
                  labelText: "Enter Your Email Address",
                  border: const UnderlineInputBorder(),
                  focusColor: Appinformation.baseColor,
                  focusedBorder: const UnderlineInputBorder(),
                  labelStyle: TextStyle(color: Appinformation.baseColor),
                )),
            const SizedBox(
              height: 10,
            ),
            TextField(
                controller: userPassword,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Enter Your Password",
                  border: const UnderlineInputBorder(),
                  focusColor: Appinformation.baseColor,
                  focusedBorder: const UnderlineInputBorder(),
                  labelStyle: TextStyle(color: Appinformation.baseColor),
                )),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {

                    if(userEmail.text == '' || userPassword.text == ''){
                      _showMyDialog(context);

                    }else{
                      setState(() {
                        _buttonMessage = "Please Wait...";
                      });
                     var result =  await FirebaseController.firebaseRegistration(userEmail.text, userPassword.text, context);
                     if(result == 1){
                       setState(() {
                         _buttonMessage = "Create Account";
                       });
                     } else{
                       setState(() {
                         _buttonMessage = "Account Created";
                       });
                     }
                    }
                  },
                  icon: Icon(
                    Icons.chevron_right,
                    color: Appinformation.secondaryColor,
                  ),
                  label:  Text("${_buttonMessage}"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Appinformation.baseColor),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Need Help ?",
                      style: TextStyle(
                          color: Appinformation.baseColor, fontSize: 12),
                    ))
              ],
            ),

            const SizedBox(
              height: 20,
            ),

          ],
        ),
      ),
    );
  }
}


Future<void> _showMyDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title:  const Text('Warning'),
        content: const Text("Please Fill All The Requireds Fields"),
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