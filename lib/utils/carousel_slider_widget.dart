import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:glass/glass.dart';
import 'package:restaurant_app/utils/custom_text.dart';

class CarouselSliderWidget extends StatefulWidget {
  @override
  _CarouselSliderWidgetState createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  final bool effectEnabled = true;
  final List<String> imgList = [
    'lib/Assets/img/deliciousmeal_one.png',
    'lib/Assets/img/deliciousmeal_two.jpg',
    'lib/Assets/img/deliciousmeal_three.jpg',
    'lib/Assets/img/deliciousmeal_pasta.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: imgList.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imgList[index]),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: height * 0.3,  // Define height relative to screen size
            viewportFraction: 1.0,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlay: false,  // Enable auto play
            autoPlayInterval: Duration(seconds: 7),  // Interval for auto play
            autoPlayAnimationDuration: Duration(milliseconds: 400),  // Animation duration
            autoPlayCurve: Curves.easeInOut,  // Animation curve
          ),
        ),
        Positioned.fill(
          top: 15,
          bottom: 15,
          left: 10,
          right: 10,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white.withOpacity(0.5),
                width: 5.0,
              ),
              borderRadius: BorderRadius.circular(10.0), // Adding border radius
            ),
            height: height * 0.25,
            width: width * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  content: 'Quick & Amazing',
                  font_size: 35,
                  fam_Dream: true,
                  fam_federo: false,
                ),
                CustomText(
                  content: 'Lorem Ipsum dolor',
                  font_size: 35,
                ),
                CustomText(
                  content: 'sit amet consectetur',
                  font_size: 35,
                ),
                CustomText(
                  content: 'lorem ipsum dolor sit amet consectetur.',
                  font_size: 18,
                ),
              ],
            ),
          ).asGlass(
            enabled: effectEnabled,
            tintColor: Colors.transparent.withOpacity(0.8),
            blurX: 15, // Optional: Adds more glass-like blur
            blurY: 15, // Optional: Adds more glass-like blur
          ),
        ),
      ],
    );
  }
}
