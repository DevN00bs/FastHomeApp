import 'package:fast_home/pages/initial_page.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: ListView(
              padding: EdgeInsets.all(15),
              children: [
                SizedBox( height: 20 ),
                userCard(),
                SizedBox( height: 10 ),
                textInfo(context)
              ]
            )
          ),
      );
  }
}

userCard(){
  return Column(
            children: [
              CircleAvatar(
              backgroundImage: AssetImage('images/user.png'),
              backgroundColor: Colors.white,
              radius: 80,
            ),
            SizedBox( height: 10 ),
            Text(
              'DefaultUsername_01',
              style: TextStyle(
                fontSize: 20.0,
                //fontWeight: FontWeight.bold,
                //fontFamily: 'Pacifico'
              ),
            ),
            Divider(
              thickness: 1,
              height: 35,
            ),
            ],
          );
}

textInfo(BuildContext context){
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
        onPressed: () { 
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