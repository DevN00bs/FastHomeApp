import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailPage extends StatefulWidget {
  static const List<String> imageList = [
    "https://u-storage.com.mx/wp-content/uploads/2019/02/departamento-01.jpg",
    "https://elcomercio.pe/resizer/02VIzTJ4A2UsfFhDU5Fp-HWFLp4=/980x0/smart/filters:format(jpeg):quality(75)/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/5N6HAL2ZAZBIFN5M4ZPSXC7LOQ.jpg",
    "https://www.triada.com.pe/noticias/wp-content/uploads/2019/07/triada-aprovechar-espacios-departamento-pequeno.jpg",
    "https://www.ciudaris.com/blog/wp-content/uploads/requisitos-cumplir-comprar-departamento-lima.jpg",
  ];

  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Center(
              child: CarouselSlider(
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  autoPlay: true,
                ),
                items: DetailPage.imageList
                    .map((e) => ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              Image.network(
                                e,
                                width: 1070,
                                height: 350,
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 30.00, top: 20.0),
              child: Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Main Street Location',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 30.00, top: 20.0),
              child: Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Price: ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400)),
                    TextSpan(
                        text: '300.00',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(100.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  border: Border.all(color: Colors.black))),
          Container(
            margin: const EdgeInsets.only(
              left: 20.0,
              top: 5.0,
              right: 20.0,
              bottom: 20.0,
            ),
            padding: const EdgeInsets.all(45.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                border: Border.all(color: Colors.black)),
            child: Row(children: <Widget>[
              SizedBox(
                width: 250,
                child: Image.asset(
                  'images/persono.png',
                  width: 20,
                  height: 20,
                ),
              ),
              SizedBox(
                child: RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                  itemSize: 20,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
            ]),
          ),
          Container(
              height: 400,
              margin: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                  color: Colors.white, border: Border.all(color: Colors.black)),
              child: GoogleMap(
                mapType: MapType.normal,
                onMapCreated: _onMapCreated,
                gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                  Factory<OneSequenceGestureRecognizer>(
                    () => EagerGestureRecognizer(),
                  ),
                },
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 12.0,
                ),
              )),
        ]),
      )),
    );
  }
}
