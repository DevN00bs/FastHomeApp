import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService extends ChangeNotifier{

  //final String _baseUrl = 'http://localhost:37946/api/auth/login';
  final String _registerUrl = 'https://real-state-api.herokuapp.com/api/auth/register';
  //no api token required for register
  final String _loginUrl = 'https://real-state-api.herokuapp.com/api/auth/login';
  //api token check for session REQUIRED
  final storage = new FlutterSecureStorage();

  Future<String?> createUser( String email, String username, String password ) async {

    //post info to the restapi
    final Map<String, dynamic> authData = {
      'email': email,
      'username': username,
      'password': password,
    };

    //url to connect as in postman
    final url = Uri.parse(_registerUrl);
    
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

    if ( decodedResp.containsKey('token') ) {
      
      await storage.write(key: 'idToken', value: decodedResp['token']);

      return null;
      
    } else {
      return 'Error';
    }

  }

  Future<String?> login( String username, String password ) async {

    //post info to the restapi
    final Map<String, dynamic> authData = {
      'username': username,
      'password': password,
    };

    //url to connect as in postman
    final url = Uri.parse(_loginUrl);
    
    //http ask
    final resp = await http.post(
      url, 
      headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: 
    json.encode(authData)
    );
    //encode auth data to post

    final Map<String, dynamic> decodedResp = json.decode( resp.body );

    if ( decodedResp.containsKey('token') ) {

      //print( decodedResp );
      await storage.write(key: 'idToken', value: decodedResp['token']);
      await storage.write(key: 'uname', value: username);

      return null;

    } else {

      //return decodedResp;
      
    }

  }

  Future logout() async {

    await storage.delete(key: 'idtoken');
    await storage.delete(key: 'uname');

    return;

  }

  //token check
  Future<String> readToken() async {

    return await storage.read(key: 'idToken') ?? ''; //?? then...

  }

   Future<String> readUser() async {

    return await storage.read(key: 'uname') ?? ''; //?? then...

  }
  
}
