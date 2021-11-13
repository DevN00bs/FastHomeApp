import 'package:fast_home/pages/pages_page.dart';
import 'package:fast_home/pages/login_page.dart';
import 'package:fast_home/pages/register_page.dart';

import 'package:flutter/material.dart';

class InitialPage extends StatelessWidget {
  var bgcolor = Colors.white;

  final blueCustom = Color.fromARGB(100, 51, 91, 103);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: bgcolor,
        body: SafeArea(
          child: Container(
          decoration: BoxDecoration(
            //color: const Color(0x15FFF3B0)
          ),
          child: PageView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text('')
                ),
                Expanded(
                  child: Text('')
                ),
                Expanded(
                  child: Image.asset('images/logo-big.png')
                ),
                Expanded(
                  child: Text(
                    '\n\nWelcome',
                    style: TextStyle(fontSize: 32, height: .5, fontWeight: FontWeight.w600, color: Color(0xFF335C67)),
                    
                    )
                ),
                Expanded(
                  child: Text('')
                ),
                Expanded(
                  child: Text('')
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Expanded(
                    child: Text('')
                    ),
                  Expanded(
                    child: ElevatedButton(
                    onPressed: () { 
                      print('Log In');
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        (Route<dynamic> route) => false,
                        );
                      }, 
                    //filled
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xFF335C67)),
                      textStyle: MaterialStateProperty.all(TextStyle(fontSize: 19))
                    ),
                    child: Text('Log In'),
                    )
                    ),
                    Expanded(
                    child: Text('')
                    ),
                ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Expanded(
                    child: Text('')
                    ),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () { 
                      print('Sign Up');
                      /*
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage())
                        );
                      }, 
                      */ 
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                        (Route<dynamic> route) => false,
                        );
                      }, 
                    //outlined
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Color(0xFF335C67)),
                      textStyle: MaterialStateProperty.all(TextStyle(fontSize: 19, color: Color(0xFF335C67)))
                    ),
                    child: Text('Sign up')
                    )
                    ),
                    Expanded(
                    child: Text('')
                    ),
                    
                ]
                ),
                Expanded(
                  child: Text('')
                ),
              ],
            ),
            ]
          ),
        )
      )
      )
    );
  }
}