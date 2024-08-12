import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://cdn.pixabay.com/photo/2018/04/22/13/04/hallway-3341001_640.jpg',
      'https://cdn.pixabay.com/photo/2015/12/09/01/02/mandalas-1084082_640.jpg',
      'https://cdn.pixabay.com/photo/2020/07/22/07/04/design-5428296_640.png',
      'https://cdn.pixabay.com/photo/2015/12/09/01/02/mandalas-1084082_640.jpg',
      'https://cdn.pixabay.com/photo/2020/07/22/07/04/design-5428296_640.png',
    ];

    return CarouselSlider.builder(
      itemCount: imgList.length,
      itemBuilder: (context, index, realIndex) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(imgList[index]),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 220,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 2),
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
      ),
    );
  }
}
