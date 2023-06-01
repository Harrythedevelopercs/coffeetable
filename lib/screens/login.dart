import 'package:fastfodd/providers/appInformation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/firebaseController.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userEmail =  TextEditingController();
  TextEditingController userPassword =  TextEditingController();

  var _buttonMessage = "Login";


  initState() {
    super.initState();
    _buttonMessage = "Login";
  }
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
              "Welcome Back Coffee Cup Is Waiting For You",
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
                      var result = await FirebaseController.firebaseLogin(userEmail.text, userPassword.text, context);
                      if(result == 1 ){
                        setState(() {
                          _buttonMessage = "Login";
                        });
                      }else{
                        setState(() {
                          _buttonMessage = "Login Successful";
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
                      "Forget Password ?",
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