import 'package:fast_home/pages/pages_page.dart';
import 'package:fast_home/pages/login_page.dart';
import 'package:fast_home/pages/register_page.dart';

import 'package:flutter/material.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 100, bottom: 10),
                child: Text(
                  "Registration Form",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30.0),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 100, bottom: 10),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "Enter a username",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(8.0)))),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 10, bottom: 10),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "Enter your E-mail",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(8.0)))),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 10, bottom: 10),
                child: TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "Enter your Password",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(8.0)))),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 10, bottom: 30),
                child: TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "Confirm your Password",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(8.0)))),
                ),
              ),
              Container(
                height: 50,
                width: 300,
                /*
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(10)),
                */
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xFF335C67)),
                      textStyle: MaterialStateProperty.all(TextStyle(fontSize: 19)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)
                              )
                          )
                    ),
                  onPressed: () {
                      print('Signed up successfully');
                      Navigator.pushReplacementNamed(context, 'pages_page');
                      }, 
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                //already account
              ),
              TextButton(
                onPressed: () {
                  //FORGOT PASSWORD SCREEN HERE
                  Navigator.pushReplacementNamed(context, 'login_page');
                },
                child: const Text(
                  'Already an account? Log in',
                  style: TextStyle(color: Color(0xFF335C67), fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

