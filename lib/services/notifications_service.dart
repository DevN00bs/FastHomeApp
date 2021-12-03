import 'package:flutter/material.dart';

class NotificationsService {

  static GlobalKey<ScaffoldMessengerState> messengerKey = new GlobalKey<ScaffoldMessengerState>(); //to keep state/reference to mateapp wget
  //snackbar
  static showSnackbar( String message ) {

    final snackBar = new SnackBar(
      content: Text( message, style: TextStyle( color: Colors.white, fontSize: 20 ) ), 
      //action: SnackBarAction(label: 'GOT IT', onPressed: ScaffoldMessenger.of(context).hideCurrentSnackBar),
    );

    messengerKey.currentState!.showSnackBar(snackBar);
  }
  
}