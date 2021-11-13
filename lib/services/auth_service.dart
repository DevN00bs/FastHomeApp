import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService extends ChangeNotifier{

  //final String _baseUrl = 'http://localhost:37946/api/auth/login';
  final String _baseUrl = 'https://real-state-api.herokuapp.com';

  Future<String?> createUser( String username, String email, String password ) async {

    //post info to the restapi
    final Map<String, dynamic> authData = {
      'username': username,
      'email': email,
      'password': password
    };

    //url to connect as in postman
    final url = Uri.https(_baseUrl, '/api/auth/register');
    
    //http ask
    final resp = await http.post(url, body: json.encode(authData));//encode auth data to post
    final Map<String, dynamic> decodedResp = json.decode( resp.body );

    print( decodedResp );

  }
  
}
