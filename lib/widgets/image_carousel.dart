import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../models/youth_group.dart';

class ImageCarousel extends StatelessWidget {
  final YouthGroup youthGroup;

  ImageCarousel(this.youthGroup);

  @override
  Widget build(BuildContext context) {
    return youthGroup.images[0] != ''
        ? CarouselSlider.builder(
            itemCount: youthGroup.images.length,
            options: CarouselOptions(
              viewportFraction: 0.6,
              enlargeCenterPage: false,
            ),
            itemBuilder: (context, index, realIdx) {
              return Padding(
                padding: EdgeInsets.all(4),
                child: Image.asset(
                  youthGroup.images[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          )
        : Container();
  }
}
