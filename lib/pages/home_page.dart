import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:fast_home/pages/detail_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 630,
        child: ListView(
          padding: EdgeInsets.all(15),
          children: [_cardLess2(context), SizedBox(height: 15)],
        ),
      ),
    );
  }

  cardInfo(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(5, 0, 1, 0),
        child: Column(children: [
          SizedBox(height: 10),

          //title
          SizedBox(
            width: 185,
            height: 60,
            child: Text(
              'Name of the property retrieved from a GET in the RESTAPI',
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15),
            ),
          ),

          //seller
          SizedBox(
            width: 185,
            height: 20,
            child: Text(
              'Seller: SELLER FROM DB',
              style: TextStyle(),
            ),
          ),

          //size
          SizedBox(
            width: 185,
            height: 35,
            child: Text(
              'Size: SIZE FROM DB',
              style: TextStyle(),
            ),
          ),

          //icons in ROW
          Row(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 6, 0),
                height: 40,
                child: Column(children: [
                  Icon(Icons.meeting_room_outlined),
                  Text(
                    '6',
                    style: TextStyle(),
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                height: 40,
                child: Column(children: [
                  Icon(Icons.bathtub_outlined),
                  Text(
                    '4',
                    style: TextStyle(),
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                height: 40,
                child: Column(children: [
                  Icon(Icons.directions_car_filled_outlined),
                  Text(
                    '3',
                    style: TextStyle(),
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(6, 0, 0, 0),
                height: 40,
                child: Column(children: [
                  Icon(Icons.stairs_outlined),
                  Text(
                    '2',
                    style: TextStyle(),
                  ),
                ]),
              ),
              TextButton(
                child: Text('Test'),
                onPressed: () {
                  print('Sign Up');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailPage()));
                },
              )
            ],
          ),
        ]));
  }

  cardPic() {
    return FadeInImage(
      image: NetworkImage(
          'https://images.unsplash.com/photo-1549517045-bc93de075e53?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZmFtaWx5JTIwaG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),
      placeholder: AssetImage('images/jar-loading.gif'),
      fadeInDuration: Duration(milliseconds: 200),
      height: 140,
      width: 185,
      fit: BoxFit.cover, //to adjust the pic on the size
    );
  }

  Widget _cardLess2(BuildContext context) {
    final cardCustom = Container(
        //clipBehavior: ,//para no salir de la carta, no jalaxd
        child: Column(
      children: [
        Column(children: [
          Row(
            children: [cardPic(), cardInfo(context)],
          ),
          Column(children: [
            Row(
              children: [
                Text(
                  '\$500000.00',
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            Row(
              children: [Text('Single pay')],
            )
          ]),
        ]),
      ],
    ));

    return Container(
      child: ClipRRect(
        child: cardCustom,
        borderRadius: BorderRadius.circular(5),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2.0,
                offset: Offset(2.0, 4.0))
          ]), //box decoration del div=container
    );
  }
}
