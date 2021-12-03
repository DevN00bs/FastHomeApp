import 'dart:collection';

import 'package:fast_home/entities/carrousel_property.dart';
import 'package:fast_home/entities/detail_property.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, this.propId}) : super(key: key);

  final propId;

  @override
  Widget build(BuildContext context) {
    Detail data;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SingleChildScrollView(
          child: FutureBuilder<Detail>(
            //giving a future; removing future makes it snapshot
            future: new DetailedProperty().fetchProperty(propId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                data = snapshot.data!;

                _setMarkers(
                  LatLng(data.latitude.toDouble(), data.longitude.toDouble()),
                );

                return Column(children: <Widget>[
                  Carrousel(imageList: data.photos),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30.00, top: 20.0),
                      child: Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: data.address.toString(),
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
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
                                text: data.currencySymbol +
                                    data.price.toString() +
                                    " " +
                                    data.currencyCode,
                                // NumberFormat.currency().format(data.price),
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, bottom: 20, top: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border: Border.all(color: Colors.black)),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(right: 100, bottom: 15),
                                  child: Text.rich(
                                    TextSpan(
                                        text: "Property Details",
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900)),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(right: 150, bottom: 10),
                                  child: Row(children: <Widget>[
                                    Text.rich(
                                      TextSpan(
                                          text: "Weight: ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                          text: data.terrainWidth.toString() +
                                              "m",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w300)),
                                    )
                                  ]),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(right: 150, bottom: 10),
                                  child: Row(children: <Widget>[
                                    Text.rich(
                                      TextSpan(
                                          text: "Height: ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                          text: data.terrainHeight.toString() +
                                              "m",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w300)),
                                    )
                                  ]),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(right: 150, bottom: 10),
                                  child: Row(children: <Widget>[
                                    Text.rich(
                                      TextSpan(
                                          text: "Bedrooms: ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                          text: data.bedroomAmount.toString(),
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w300)),
                                    )
                                  ]),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: 0, bottom: 10, top: 30),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(right: 0, bottom: 10),
                                  child: Row(children: <Widget>[
                                    Text.rich(
                                      TextSpan(
                                          text: "Garage Space: ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                          text: data.garageSize.toString(),
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w300)),
                                    )
                                  ]),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(right: 0, bottom: 10),
                                  child: Row(children: <Widget>[
                                    Text.rich(
                                      TextSpan(
                                          text: "Floors: ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                          text: data.floorAmount.toString(),
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w300)),
                                    )
                                  ]),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(right: 0, bottom: 10),
                                  child: Row(children: <Widget>[
                                    Text.rich(
                                      TextSpan(
                                          text: "Bathrooms: ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                          text: data.bathroomAmount.toString(),
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w300)),
                                    )
                                  ]),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 20.0,
                      top: 0,
                      right: 20.0,
                      bottom: 20.0,
                    ),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border: Border.all(color: Colors.black)),
                    child: Row(children: <Widget>[
                      SizedBox(
                        width: 130,
                        height: 30,
                        child: Image.asset(
                          'images/persono.png',
                          width: 10,
                          height: 10,
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(right: 0, top: 0),
                                child: Text.rich(
                                  TextSpan(
                                      text: data.username,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              width: 200,
                              child: RatingBar.builder(
                                // ignore: unnecessary_null_comparison
                                initialRating: data.userRating != null
                                    ? data.userRating!.toDouble()
                                    : 0,
                                ignoreGestures: true,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 0.0),
                                itemSize: 30,
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (double value) {},
                              ),
                            )
                          ],
                        ),
                      )
                    ]),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 20.0,
                      top: 0,
                      right: 20.0,
                      bottom: 20.0,
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(right: 0, top: 0),
                        child: Text.rich(
                          TextSpan(
                              text: "Description:",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 20.0,
                      top: 0,
                      right: 20.0,
                      bottom: 20.0,
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(right: 0, top: 0),
                        child: Text.rich(
                          TextSpan(
                              text: data.description,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w300)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 400,
                    margin: const EdgeInsets.only(
                      bottom: 20.0,
                      left: 20.0,
                      right: 20.0,
                    ),
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black)),
                    child: GoogleMap(
                      mapType: MapType.normal,
                      onMapCreated: _onMapCreated,
                      gestureRecognizers: <
                          Factory<OneSequenceGestureRecognizer>>{
                        Factory<OneSequenceGestureRecognizer>(
                          () => EagerGestureRecognizer(),
                        ),
                      },
                      initialCameraPosition: CameraPosition(
                        target: new LatLng(data.latitude.toDouble(),
                            data.longitude.toDouble()),
                        zoom: 17.0,
                      ),
                      markers: _markers,
                      zoomControlsEnabled: false,
                      buildingsEnabled: true,
                      myLocationEnabled: true,
                    ),
                  ),
                ]);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        )));
  }
}

late GoogleMapController mapController;

Set<Marker> _markers = HashSet<Marker>();

void _setMarkers(LatLng point) {
  final String markerIdVal = 'marker_id_1';
  _markers.add(
    Marker(
      markerId: MarkerId(markerIdVal),
      position: point,
    ),
  );
}

void _onMapCreated(GoogleMapController controller) {
  mapController = controller;
}
