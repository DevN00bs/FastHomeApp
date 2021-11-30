import 'package:fast_home/pages/pages_export.dart';
import 'package:fast_home/services/services.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckAuthPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context, listen: false);//not redraw so listen on false

    return Scaffold(
        body: Center(
            child: FutureBuilder(
              future: authService.readToken(),//read token
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {

                if ( !snapshot.hasData ) 
                  return Text('');

                if ( snapshot.data == '') {
                //exec as this builder finishes
                Future.microtask(() {
                    //navigate
                    Navigator.pushReplacement(context, PageRouteBuilder(
                      pageBuilder: ( _, __, ___ ) => InitialPage(),//no token data
                      transitionDuration: Duration( seconds: 0)
                      )
                    );

                });
                  
                } else {

                  //exec as this builder finishes
                Future.microtask(() {

                    //Navigator.of(context).pushReplacementNamed('initial_page');
                    //navigate
                    Navigator.pushReplacement(context, PageRouteBuilder(
                      pageBuilder: ( _, __, ___ ) => InitialPage(),
                      transitionDuration: Duration( seconds: 0)
                      )
                    );

                });

                }

                return Container();
                
              },
            ),
          ),
      );
  }
}