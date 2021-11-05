import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class fetchData{
Future<List<Basic>> fetchBasic() async {
  final response = await http
      .get(Uri.parse('https://real-state-api.herokuapp.com/api/properties'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<dynamic> decoded = json.decode(response.body);
    return decoded.map((basic) => new Basic.fromJson(basic)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load basic');
  }
}
}
//to be moved into another provider
class BasicsList {
  final List<Basic> basics;

  BasicsList({
    
    required this.basics,

  });

  factory BasicsList.fromJson(List<dynamic> parsedJson) {

    List<Basic> basics = [];
    basics = parsedJson.map((i) => Basic.fromJson(i)).toList();

    return new BasicsList(
      basics: basics
    );
  }
}

class Basic{
  
  final String photoURL;
  final String address;
  final String username;
/*
  final double terrainHeight;
  final double terrainWidth;
  final double price;

  final String currencySymbol;
  final String currencyCode;

  final int contractType;
  final int bedroomAmount;

  final double bathroomAmount; 

  final int floorAmount;  
  final int garageSize;
*/

  Basic({
    required this.photoURL,
    required this.address,
    required this.username,
/*
    required this.terrainHeight,
    required this.terrainWidth,
    required this.price,

    required this.currencySymbol,
    required this.currencyCode,

    required this.contractType,
    required this.bedroomAmount,

    required this.bathroomAmount,

    required this.floorAmount,
    required this.garageSize
*/
  });

  factory Basic.fromJson(Map<String, dynamic> json){
    return new Basic(
      photoURL: json['photoURL'],
      address: json['address'],
      username: json['username'],
/*
      terrainHeight: json['terrainHeight'],
      terrainWidth: json['terrainWidth'],
      price: json['price'],

      currencySymbol: json['currencySymbol'],
      currencyCode: json['currencyCode'],

      contractType: json['contractType'],
      bedroomAmount: json['bedroomAmount'],
      
      bathroomAmount: json['bathroomAmount'],
      floorAmount: json['floorAmount'],
      garageSize: json['garageSize']
*/
    );
  }

}