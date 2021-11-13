import 'package:fast_home/pages/pages_page.dart';
import 'package:fast_home/pages/login_page.dart';
import 'package:fast_home/pages/register_page.dart';

import 'package:flutter/material.dart';

// void main() {
//   runApp(const LoginScreen());
// }

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: SizedBox(
                      width: 200,
                      height: 300,
                      child: Image.asset('images/loginLogo.png')),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'example@hotmail.com'),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 30),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: '********'),
                ),
              ),


              Container(
                height: 50,
                width: 300,
                /*
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                */
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xFF335C67)),
                      textStyle: MaterialStateProperty.all(TextStyle(fontSize: 22)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)
                              )
                          )
                    ),
                  onPressed: () {
                      print('Logged in successfully');
                      Navigator.pushReplacementNamed(context, 'pages_page');
                      }, 
                  child: const Text(
                    'Log In',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),

              TextButton(
                onPressed: () {
                  //FORGOT PASSWORD SCREEN HERE
                  
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(color: Color(0xFF335C67), fontSize: 15),
                ),
              ),
              
              TextButton(
                onPressed: () {
                  //ALREADY AN ACCOUNT HERE
                  Navigator.pushReplacementNamed(context, 'register_page');
                },
                child: const Text(
                  'No account? Sign up',
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
