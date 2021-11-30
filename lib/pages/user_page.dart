import 'package:fast_home/pages/pages_export.dart';
import 'package:fast_home/services/services.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserPage extends StatelessWidget {

  
  
  @override
  Widget build(BuildContext context) {

  

    return Scaffold(
        body: Container(
            child: ListView(
              padding: EdgeInsets.all(15),
              children: [
                SizedBox( height: 20 ),
                userCard( context ),
                SizedBox( height: 10 ),
                textInfo( context )
              ]
            )
          ),
      );
  }
}

userCard( context ) async{

  final storage = new FlutterSecureStorage();

  final authService = Provider.of<AuthService>(context, listen: false);

  return Column(
            children: [
              CircleAvatar(
              backgroundImage: AssetImage('images/user.png'),
              backgroundColor: Colors.white,
              radius: 80,
            ),
            SizedBox( height: 10 ),
            FutureBuilder<Widget>(
              future: authService.readUser(),
              initialData: Text(''),
              builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                return snapshot.data!;
              },
            ),
            Divider(
              thickness: 1,
              height: 35,
            ),
            ],
          );
}

textInfo(BuildContext context){
  
  final authService = Provider.of<AuthService>(context, listen: false);//not redraw
  
  return Column(
    children: [
      Row(
      children: [
      SizedBox(
        width: 350,
        child: Text(
          'Email\nEmailExample.01@mail.com',
          style: TextStyle(
            fontSize: 16
          ),
          ),
      ),
      ]
    ),
    SizedBox( height: 20 ),
    Row(
      children: [
      SizedBox(
        width: 350,
        child: Text(
          'Change password',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF335C67)
          ),
          ),
      ),
      ]
    ),
    SizedBox( height: 200 ),
    SizedBox(
      width: 350,
      child: OutlinedButton(
        onPressed: () async{ 
          await authService.logout();
          print('Log Out');
          Navigator.pushReplacementNamed(context, 'initial_page');
        },
        child: Text(
          'Log out',
          style: TextStyle(
            color: Colors.red
          ),
          )
        ),
    )
    ]
  );
}