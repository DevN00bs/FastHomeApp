import 'package:fast_home/services/services.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final group = Future.wait([
      authService.readUser(),
      //authService.readToken(),
      authService.mail(),
    ]);

    return Scaffold(
        body: FutureBuilder(
          future: group,
          builder: (context, AsyncSnapshot<List<String>> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator()
                );
            }

            return Container(
                child: ListView(
                    padding: EdgeInsets.all(15),
                    children: [
                      SizedBox( height: 20 ),
                      userCard( snapshot.data![0] ),
                      SizedBox( height: 10 ),
                      textInfo( context, snapshot.data![1] )
                    ]
                )
            );
          },
        ),
      );
  }
}

userCard(String username) {


  return Column(
            children: [
              Container(
              margin: EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
              child: Text(
                username[0].toUpperCase(),
                style: TextStyle( fontSize: 80, color: Colors.white ),
                ),
              backgroundColor: Color(0xFF335C67),
              radius: 80,
              ),
            ),
              /*
              CircleAvatar(
              backgroundImage: AssetImage('images/user.png'),
              backgroundColor: Colors.white,
              radius: 80,
              
            ),*/
            SizedBox( height: 10 ),
            Text(
              username, 
              style: TextStyle(fontSize: 25)
              ),
            Divider(
              thickness: 1,
              height: 35,
            ),
            ],
          );
}

textInfo(BuildContext context, String mail){
  
  final authService = Provider.of<AuthService>(context, listen: false);//not redraw
  
  return Column(
    children: [
      Row(
      children: [
      SizedBox(
        width: 350,
        child: Text(
          mail,
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