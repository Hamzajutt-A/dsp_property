import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AppCarousel extends StatefulWidget {
  @override
  _AppCarouselState createState() => _AppCarouselState();
}

class _AppCarouselState extends State<AppCarousel> {
  int _currentIndex = 0;

  final List<String> _images = [
    'assets/images/carousal1.jpg',
    'assets/images/carousal2.jpg',
    'assets/images/carousal3.jpg',
    'assets/images/house.jpg',
    'assets/images/house1.jpg',
    'assets/images/house2.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.30,
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 18.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.25,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: _images.map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    );
                  },
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _images.asMap().entries.map((entry) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == entry.key
                      ? Colors.black
                      : Colors.black26,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
