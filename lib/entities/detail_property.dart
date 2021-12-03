import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DetailedProperty {
  Future<Detail> fetchProperty(int propId) async {
    final response = await http.get(
        Uri.parse('https://real-state-api.herokuapp.com/api/property/$propId'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      dynamic decoded = json.decode(response.body);
      return new Detail.fromJson(decoded);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load detail');
    }
  }
}

class DetailOb {
  final Detail details;

  DetailOb({
    required this.details,
  });

  factory DetailOb.fromJson(dynamic parsedJson) {
    Detail details;
    details = parsedJson.map((i) => Detail.fromJson(i));

    return new DetailOb(details: details);
  }
}

class Detail {
  final List<dynamic> photos;

  final String address;
  final String description;

  final String username;
  final num? userRating;

  final num terrainHeight;
  final num terrainWidth;
  final num price;

  final String currencySymbol;
  final String currencyCode;
  final int contractType;

  final int bedroomAmount;
  final num bathroomAmount;

  final int garageSize;
  final int floorAmount;

  final num latitude;
  final num longitude;

  Detail(
      {required this.photos,
      required this.address,
      required this.description,
      required this.username,
      required this.userRating,
      required this.terrainHeight,
      required this.terrainWidth,
      required this.price,
      required this.currencySymbol,
      required this.currencyCode,
      required this.contractType,
      required this.bedroomAmount,
      required this.bathroomAmount,
      required this.garageSize,
      required this.floorAmount,
      required this.latitude,
      required this.longitude});

  factory Detail.fromJson(Map<String, dynamic> json) {
    return new Detail(
        photos: json['photos'],
        address: json['address'],
        description: json['description'],
        username: json['username'],
        userRating: json['userRating'],
        terrainHeight: json['terrainHeight'],
        terrainWidth: json['terrainWidth'],
        price: json['price'],
        currencySymbol: json['currencySymbol'],
        currencyCode: json['currencyCode'],
        contractType: json['contractType'],
        bedroomAmount: json['bedroomAmount'],
        bathroomAmount: json['bathroomAmount'],
        garageSize: json['garageSize'],
        floorAmount: json['floorAmount'],
        latitude: json['latitude'],
        longitude: json['longitude']);
  }
}
