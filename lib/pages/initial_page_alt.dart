import 'package:fast_home/pages/pages_export.dart';

import 'package:flutter/material.dart';

class InitialPageAlt extends StatelessWidget {
  var bgcolor = Color(0xFF335C67);

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

                SizedBox( height: 200 ),

                Expanded(
                  child: Image.asset('images/logo-big-white.png')
                ),

                SizedBox( height: 180 ),

                MaterialButton(
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(30) ),
                  elevation: 0,
                  color: Colors.white,
                  //splashColor: Color(0xFF335C67),
                  
                  splashColor: Color(0xFFE0E0E0),
                  onLongPress: null,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                      child: Text(
                      'Log in',
                      style: TextStyle(color: Color(0xFF335C67), fontSize: 20, fontWeight: FontWeight.w400)
                      ),
                    ),
                  onPressed: () { 
                    print('Log In');
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                          (Route<dynamic> route) => false,
                        );
                      }, 
                  ),

                SizedBox( height: 20 ),
                  
                MaterialButton(
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(30), side: BorderSide( color: Colors.white, width: 2 ) ),
                  elevation: 0,
                  color: Color(0xFF335C67),
                  //splashColor: Color(0xFF335C67),
                  
                  splashColor: Color(0xFFE0E0E0),
                  onLongPress: null,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Text(
                      'Sign up',
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400)
                      ),
                    ),
                  onPressed: () { 
                    print('Sign up');
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                          (Route<dynamic> route) => false,
                        );
                      }, 
                  ),
                
                SizedBox( height: 100 )
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