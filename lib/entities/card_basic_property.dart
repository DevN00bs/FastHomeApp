import 'package:fast_home/entities/basic_property.dart';
import 'package:fast_home/pages/detail_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard({required this.data, Key? key}) : super(key: key);

  final Basic data;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () {
          print('Test');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailPage(propId: data.propertyId)));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Text(
                      data.username.substring(0, 1).toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Theme.of(context).accentColor,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.address,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF335C67)),
                      ),
                      Text(data.currencySymbol +
                          data.price.toString() +
                          " " +
                          data.currencyCode),
                      Text(data.username),
                    ],
                  ),
                ],
              ),
            ),
            Image.network(
              data.photoURL,
              fit: BoxFit.fitHeight,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.bed_outlined,
                            color: Theme.of(context).accentColor,
                          ),
                          Text(data.bedroomAmount.toString()),
                        ],
                      ),
                      Column(children: [
                        Icon(
                          Icons.bathtub_outlined,
                          color: Theme.of(context).accentColor,
                        ),
                        Text(data.bathroomAmount.toString()),
                      ]),
                      Column(children: [
                        Icon(
                          Icons.directions_car_outlined,
                          color: Theme.of(context).accentColor,
                        ),
                        Text(data.garageSize.toString()),
                      ]),
                      Column(children: [
                        Icon(
                          Icons.stairs_outlined,
                          color: Theme.of(context).accentColor,
                        ),
                        Text(data.floorAmount.toString()),
                      ]),
                      Column(
                        children: [
                          Icon(
                            Icons.square_foot_outlined,
                            color: Theme.of(context).accentColor,
                          ),
                          Text(data.terrainHeight.toString() +
                              " x " +
                              data.terrainWidth.toString() +
                              " m."),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
