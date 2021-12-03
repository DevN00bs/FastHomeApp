import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:fast_home/entities/detail_property.dart';

class Carrousel extends StatelessWidget {

  const Carrousel({Key? key, required this.imageList}) : super(key: key);

  final List<dynamic> imageList;

  // static const List<String> imageList = [
  //   // "https://u-storage.com.mx/wp-content/uploads/2019/02/departamento-01.jpg",
  //   // "https://elcomercio.pe/resizer/02VIzTJ4A2UsfFhDU5Fp-HWFLp4=/980x0/smart/filters:format(jpeg):quality(75)/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/5N6HAL2ZAZBIFN5M4ZPSXC7LOQ.jpg",
  //   // "https://www.triada.com.pe/noticias/wp-content/uploads/2019/07/triada-aprovechar-espacios-departamento-pequeno.jpg",
  //   // "https://www.ciudaris.com/blog/wp-content/uploads/requisitos-cumplir-comprar-departamento-lima.jpg",
  // ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            autoPlay: true,
          ),
          items: imageList
          //items: Carrousel.imageList
              .map((e) => ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image.network(
                          e["url"],
                          //e,
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
    ));
  }
}
