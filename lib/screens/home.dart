import 'package:fastfodd/providers/appInformation.dart';
import 'package:fastfodd/screens/login.dart';
import 'package:fastfodd/screens/register.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Appinformation.baseColor,
            image: const DecorationImage(
                image: AssetImage('assets/images/bean.png'),
                alignment: Alignment.bottomCenter),
          ),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/images/logo.png'),
                width: 250,
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Appinformation.secondaryColor),
                icon: Icon(Icons.coffee_rounded,
                    color:
                        Appinformation.baseColor), //icon data for elevated button
                label: Text(
                  "Need Coffee Urgent!",
                  style: TextStyle(color: Appinformation.baseColor),
                ), //label text
              ),
              const SizedBox(
                height: 15,
              ),
              Row(children: [
                Expanded(
                    child: Divider(
                  endIndent: 30,
                  color: Appinformation.secondaryColor,
                  indent: 30,
                )),
                Text(
                  "OR",
                  style: TextStyle(color: Appinformation.secondaryColor),
                ),
                Expanded(
                    child: Divider(
                  endIndent: 30,
                  color: Appinformation.secondaryColor,
                  indent: 30,
                )),
              ]),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Appinformation.secondaryColor),
                icon: Icon(Icons.coffee_maker_outlined,
                    color:
                        Appinformation.baseColor), //icon data for elevated button
                label: Text(
                  "Let's Create A Account",
                  style: TextStyle(color: Appinformation.baseColor),
                ), //label text
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton(onPressed: (){}, child: Text("Need Help !",style: TextStyle(
                color: Appinformation.secondaryColor,
                fontSize: 12
              ),))
            ],
          ),
        ),
      ),
    );
  }
}
