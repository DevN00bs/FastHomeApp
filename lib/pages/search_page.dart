import 'package:fast_home/pages/home_page.dart';

import 'dart:async';
import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fast_home/services/uri_provider.dart';

//sfulwidget
class SearchPage extends StatefulWidget {

  @override
  _SearchPageState createState() => _SearchPageState();
}

//class instanced from sfulwidget
class _SearchPageState extends State<SearchPage> {

  //late Future<List<Basic>>futureBasic;
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  List<String> _choices = [];
  List<String> _choices2 = [];
  List<String> _choices3 = [];
  List<String> _choices4 = [];

  Map searchMap = {
    'Rooms': 1,
    'Bathrooms': 1,
    'Garage': 0,
    'Floors': 0
  };

  int _hg = 15;

  int _choiceIndex = 0;
  int _choiceIndex2 = 0;
  int _choiceIndex3 = 0;
  int _choiceIndex4 = 0;

  String cRooms = '0';
  String cBathrooms = '1';
  String cGarage = '2';
  String cFloors = '3';
  
//build context
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: ListView(
        children: [
          Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(' Rooms', style: TextStyle( fontSize: 18 ),),
              ), 
              _buildChoiceChips1( ['1', '2', '3', '4', '5+'], cRooms ),

              Align(
                alignment: Alignment.topLeft,
                child: Text(' Bathrooms', style: TextStyle( fontSize: 18 ),),
              ), 
              _buildChoiceChips2( ['1', '1.5', '2', '2.5', '3+'], cBathrooms),

              Align(
                alignment: Alignment.topLeft,
                child: Text(' Garage', style: TextStyle( fontSize: 18 ),),
              ), 
              _buildChoiceChips3( ['0', '1', '2', '3+'], cGarage ),

              Align(
                alignment: Alignment.topLeft,
                child: Text(' Floors', style: TextStyle( fontSize: 18 ),),
              ), 
              _buildChoiceChips4( ['1', '2', '3+'], cFloors ),
              Container(
                height: 40,
                width: 330,
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                        textStyle: MaterialStateProperty.all(TextStyle(fontSize: 18)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  side: BorderSide( color: Color(0xFF335C67) )
                                )
                            )
                      ),
                    onPressed: () {
                        print(searchMap);
                        
                        }, 
                    child: const Text(
                      'Search',
                      style: TextStyle(color: Color(0xFF335C67), fontSize: 20),
                    ),
                  ),
              ),


              ]
          ),
        ],
      )
    );
  }
  
//widget of building the chips in the whole choice
//Rooms
 Widget _buildChoiceChips1( _choices, variant ) {

    return Container(
      height: MediaQuery.of(context).size.height/_hg,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _choices.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              ChoiceChip(
              label: Text(_choices[index]),
              selected: _choiceIndex == index,
              selectedColor: Colors.grey[300],
              onSelected: (bool selected) {
                setState(() {
                  _choiceIndex = selected ? index : 0;
                  searchMap['Rooms'] = _choiceIndex + 1;
                });
              },
              backgroundColor: Colors.transparent,
              shape: StadiumBorder(side: BorderSide(color: Colors.grey.shade500)),
              labelStyle: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold),
            ),
            ]
          );
        },
      ),
    );
  }
//Bathrooms
 Widget _buildChoiceChips2( _choices2, variant ) {

    return Container(
      height: MediaQuery.of(context).size.height/_hg,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _choices2.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              ChoiceChip(
              label: Text(_choices2[index]),
              selected: _choiceIndex2 == index,
              selectedColor: Colors.grey[300],
              onSelected: (bool selected) {
                setState(() {
                  _choiceIndex2 = selected ? index : 0;
                  searchMap['Bathrooms'] = _choiceIndex2 + 1;
                });
              },
              backgroundColor: Colors.transparent,
              shape: StadiumBorder(side: BorderSide(color: Colors.grey.shade500)),
              labelStyle: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold),
            ),
            ]
          );
        },
      ),
    );
  }
//Garage
 Widget _buildChoiceChips3( _choices3, variant ) {

    return Container(
      height: MediaQuery.of(context).size.height/_hg,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _choices3.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              ChoiceChip(
              label: Text(_choices3[index]),
              selected: _choiceIndex3 == index,
              selectedColor: Colors.grey[300],
              onSelected: (bool selected) {
                setState(() {
                  _choiceIndex3 = selected ? index : 0;
                  searchMap['Garage'] = _choiceIndex3 + 1;
                });
              },
              backgroundColor: Colors.transparent,
              shape: StadiumBorder(side: BorderSide(color: Colors.grey.shade500)),
              labelStyle: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold),
            ),
            ]
          );
        },
      ),
    );
  }
//Floors
 Widget _buildChoiceChips4( _choices4, variant ) {

    return Container(
      height: MediaQuery.of(context).size.height/_hg,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _choices4.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              ChoiceChip(
              label: Text(_choices4[index]),
              selected: _choiceIndex4 == index,
              selectedColor: Colors.grey[300],
              onSelected: (bool selected) {
                setState(() {
                  _choiceIndex4 = selected ? index : 0;
                  searchMap['Floors'] = _choiceIndex4 + 1;
                });
              },
              backgroundColor: Colors.transparent,
              shape: StadiumBorder(side: BorderSide(color: Colors.grey.shade500)),
              labelStyle: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold),
            ),
            ]
          );
        },
      ),
    );
  }

}


//idk yet but works
class CompanyWidget {
  const CompanyWidget(this.name);
  final String name;
}
