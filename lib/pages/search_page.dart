import 'package:fast_home/pages/home_page.dart';

import 'dart:async';
import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fast_home/services/uri_provider.dart';

//Basic and basics stand for basic property info
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

class SearchPage extends StatefulWidget {

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late Future<List<Basic>>futureBasic;

  @override
  void initState() {
    super.initState();
    futureBasic =  fetchBasic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: FutureBuilder<List<Basic>>(
            future: futureBasic,
            initialData: [],
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Text(snapshot.data![index].address);
                  });
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
    );
  }
}
///////////////////////////////////////////////////
/*
class _dropCustom extends State<SearchPage>{

  String? dropdownValue;
  String? dropdownValue2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 630,
        child: ListView(
          padding: EdgeInsets.all(15),
          children: [
          Column(
          children: [
          
          //drop1
          Container(
          padding: const EdgeInsets.all(15),
          child: DropdownButton<String>(
            value: dropdownValue,
            //elevation: 5,
            style: TextStyle(color: Colors.black),
            
            hint: Text(
              "Select rooms",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),

            onChanged: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },

            items: <String>[
              '1',
              '2',
              '3',
              '4',
              '5',
              '6',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),

          ),

        ),

        //drop2
          Container(
          padding: const EdgeInsets.all(15),
          child: DropdownButton<String>(
            value: dropdownValue2,
            //elevation: 5,
            style: TextStyle(color: Colors.black),
            
            hint: Text(
              "Select floors",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),

            onChanged: (String? value) {
              setState(() {
                dropdownValue2 = value!;
              });
            },

            items: <String>[
              '1',
              '2'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),

          ),

        ),
        ],
        ),

        
        ],
        ),
      ),
    );
  }*/
