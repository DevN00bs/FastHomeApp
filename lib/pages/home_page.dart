import 'package:fast_home/entities/basic_property.dart';
import 'package:fast_home/entities/card_basic_property.dart';
import 'package:flutter/material.dart';
/*
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:fast_home/pages/pages_export.dart';
import 'package:fast_home/entities/basic_property.dart';
import 'package:fast_home/entities/card_basic_property.dart';
*/

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Basic>>(
      //giving a future; removing future makes it snapshot
      future: new BasicProperty().fetchBasic(""), // ""
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text("Oops, something went wrong"));
        }

        if (snapshot.data!.isEmpty) {
          return Center(child: Text("No properties available"));
        }

        return ListView.builder(
            itemCount: snapshot.data!.length, //how much
            itemBuilder: (context, index) {
              //how
              return PropertyCard(
                  data: snapshot.data![index]); //i stands for INDEX
            });
      },
    );
  }
}