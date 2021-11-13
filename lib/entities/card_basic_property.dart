import 'package:fast_home/entities/basic_property.dart';
import 'package:fast_home/pages/detail_page.dart';
import 'package:flutter/material.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard({required this.data, Key? key}) : super(key: key);

  final Basic data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Test');
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => DetailPage()));
                },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            Expanded(
                flex: 4,
                child: Image.network(
                  data.photoURL,
                  height: 150,
                  fit: BoxFit.cover,
                )),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 134,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.address,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500, color: Color(0xFF335C67)),
                          ),
                          Text(data.currencySymbol +
                              data.price.toString() +
                              " " +
                              data.currencyCode),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.person_outline, color: Color(0xFF9E2A2B),),
                          Text(data.username),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.square_foot_outlined, color: Color(0xFF9E2A2B),),
                          Text(data.terrainHeight.toString() +
                              " x " +
                              data.terrainWidth.toString() +
                              " m."),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.bed_outlined, color: Color(0xFF9E2A2B),),
                              Text(data.bedroomAmount.toString()),
                            ],
                          ),
                          Column(children: [
                            Icon(Icons.bathtub_outlined, color: Color(0xFF9E2A2B),),
                            Text(data.bathroomAmount.toString()),
                          ]),
                          Column(children: [
                            Icon(Icons.directions_car_outlined, color: Color(0xFF9E2A2B),),
                            Text(data.garageSize.toString()),
                          ]),
                          Column(children: [
                            Icon(Icons.stairs_outlined, color: Color(0xFF9E2A2B),),
                            Text(data.floorAmount.toString()),
                          ]),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}