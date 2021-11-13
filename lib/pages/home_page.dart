import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:fast_home/pages/detail_page.dart';
import 'package:fast_home/entities/basic_property.dart';
import 'package:fast_home/entities/card_basic_property.dart';

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: FutureBuilder<List<Basic>>(//giving a future; removing future makes it snapshot
            future: new BasicProperty().fetchBasic(),
            initialData: [],
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,//how much
                  itemBuilder: (context, index) {//how
                    return PropertyCard(data: snapshot.data![index]);//i stands for INDEX
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
