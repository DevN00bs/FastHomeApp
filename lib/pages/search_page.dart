import 'package:flutter/material.dart';
import 'package:fast_home/entities/basic_property.dart';
import 'package:fast_home/entities/card_basic_property.dart';

import 'dart:convert';

//sfulwidget
class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

//class instanced from sfulwidget
class _SearchPageState extends State<SearchPage> {
  //late Future<List<Basic>>futureBasic;
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  String searchV = '';

  List<String> _choices = ['1', '2', '3', '4', '5+'];
  List<String> _choices2 = ['1', '1.5', '2', '2.5', '3+'];
  List<String> _choices3 = ['1', '2', '3+'];
  List<String> _choices4 = ['1', '2', '3+'];

  //keys
  Map<String, int> searchMap = {'bedrooms': 1, 'bathrooms': 0, 'garage': 1, 'floors': 1};

  int _hg = 15;

  int _choiceIndex = 0;
  int _choiceIndex2 = 0;
  int _choiceIndex3 = 0;
  int _choiceIndex4 = 0;

  String cRooms = '0';
  String cBathrooms = '1';
  String cGarage = '2';
  String cFloors = '3';

  String query = "";

//build context
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        body: Column(children: [
          Container(height: 280, child: _filtersListView()),
          Container(
            height: 350,
            child: _cardsFilterBasic(),
          )
        ]));
  }

  _cardsFilterBasic() {
    return FutureBuilder<List<Basic>>(
      //giving a future; removing future makes it snapshot
      future: new BasicProperty().fetchBasic(query), // Le pasamos el query construido (ver parseMap)
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.length, //how much
              itemBuilder: (context, index) {
                //how
                return PropertyCard(
                    data: snapshot.data![index]); //i stands for INDEX
              });
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }

Widget _filtersListView() {
  return ListView(
      children: [
        Column(
          children: [
          /////////
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              ' Bedrooms',
              style: TextStyle( fontSize: 18, color: Color(0xFF335C67), fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / _hg,
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
                        // De nuevo, 'bedrooms'
                        searchMap['bedrooms'] = _choiceIndex + 1;
                      });
                    },
                    backgroundColor: Colors.transparent,
                    shape: StadiumBorder(
                        side: BorderSide(color: Colors.grey.shade500)),
                    labelStyle: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold),
                  ),
                ]);
              },
            ),
          ),
          /*
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              ' Bathrooms',
              style: TextStyle( fontSize: 18, color: Color(0xFF335C67), fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / _hg,
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
                        
                        searchMap['bathrooms'] = _choiceIndex2 + 1;
                      });
                    },
                    backgroundColor: Colors.transparent,
                    shape: StadiumBorder(
                        side: BorderSide(color: Colors.grey.shade500)),
                    labelStyle: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold),
                  ),
                ]);
              },
            ),
          ),
          */
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              ' Garage',
              style: TextStyle( fontSize: 18, color: Color(0xFF335C67), fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / _hg,
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
                        
                        searchMap['garage'] = _choiceIndex3 + 1;
                      });
                    },
                    backgroundColor: Colors.transparent,
                    shape: StadiumBorder(
                        side: BorderSide(color: Colors.grey.shade500)),
                    labelStyle: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold),
                  ),
                ]);
              },
            ),
          ),
          //////
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              ' Floors',
              style: TextStyle( fontSize: 18, color: Color(0xFF335C67), fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / _hg,
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
                        
                        searchMap['floors'] = _choiceIndex4 + 1;
                      });
                    },
                    backgroundColor: Colors.transparent,
                    shape: StadiumBorder(
                        side: BorderSide(color: Colors.grey.shade500)),
                    labelStyle: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold),
                  ),
                ]);
              },
            ),
          ),


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
                          side: BorderSide(color: Color(0xFF335C67))))),
              onPressed: () {
                parseMap();
              },
              child: const Text(
                'Search',
                style: TextStyle(color: Color(0xFF335C67), fontSize: 20),
              ),
            ),
          ),

        ]),
      ],
    );
  }

//Bathrooms

//Garage

//Floors



  // Construimos el query con los valores del mapa
  // Y lo actualizamos con el estado para que sea reactivo
  parseMap() {
    String construct = "?";

    searchMap.forEach((key, value) {
      construct += key + "=" + value.toString() + "&"; // 'Key': value
    });

    print("Construct " + construct);
    setState(() {
      query = construct;
    });
  }
}

//idk yet but works
class CompanyWidget {
  const CompanyWidget(this.name);

  final String name;
}
