import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService extends ChangeNotifier{

  //final String _baseUrl = 'http://localhost:37946/api/auth/login';
  final String _baseUrl = 'https://real-state-api.herokuapp.com/api/auth/register';
  //no api token required

  Future<String?> createUser( String email, String username, String password ) async {

    //post info to the restapi
    final Map<String, dynamic> authData = {
      'email': email,
      'username': username,
      'password': password,
    };

    //url to connect as in postman
    final url = Uri.parse(_baseUrl);
    
    //http ask
    final resp = await http.post(
      url, 
      headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: 
    json.encode(authData)
    );//encode auth data to post

    final Map<String, dynamic> decodedResp = json.decode( resp.body );

    print( decodedResp );

  }
  
}
