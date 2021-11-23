import 'package:fast_home/pages/home_page.dart';

import 'dart:async';
import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fast_home/services/uri_provider.dart';

class BasicProperty{
//Basic and basics stand for basic property info
// Agregamos el query como parámetro
Future<List<Basic>> fetchBasic(String query) async {
  final response = await http
      // Y se lo agregamos al final del URL
      .get(Uri.parse('https://real-state-api.herokuapp.com/api/properties' + query));// all reactive in state

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

class BasicsList {
  final List<Basic> basics;

  BasicsList({
    required this.basics,
  });

  factory BasicsList.fromJson(List<dynamic> parsedJson) {
    List<Basic> basics = [];
    basics = parsedJson.map((i) => Basic.fromJson(i)).toList();

    return new BasicsList(basics: basics);
  }
}

class Basic {
  final int propertyId;
  final String photoURL;
  final String address;
  final String username;

  final num terrainHeight;
  final num terrainWidth;
  final num price;

  final String currencySymbol;
  final String currencyCode;

  final int contractType;
  final int bedroomAmount;

  final num bathroomAmount;

  final int floorAmount;
  final int garageSize;

  Basic(
      {required this.propertyId,
      required this.photoURL,
      required this.address,
      required this.username,
      required this.terrainHeight,
      required this.terrainWidth,
      required this.price,
      required this.currencySymbol,
      required this.currencyCode,
      required this.contractType,
      required this.bedroomAmount,
      required this.bathroomAmount,
      required this.floorAmount,
      required this.garageSize});

  factory Basic.fromJson(Map<String, dynamic> json) {
    return new Basic(
        propertyId: json['propertyId'],
        photoURL: json['photoURL'],
        address: json['address'],
        username: json['username'],
        terrainHeight: json['terrainHeight'],
        terrainWidth: json['terrainWidth'],
        price: json['price'],
        currencySymbol: json['currencySymbol'],
        currencyCode: json['currencyCode'],
        contractType: json['contractType'],
        bedroomAmount: json['bedroomAmount'],
        bathroomAmount: json['bathroomAmount'],
        floorAmount: json['floorAmount'],
        garageSize: json['garageSize']);
  }
}
