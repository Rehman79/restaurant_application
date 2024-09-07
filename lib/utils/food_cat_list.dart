import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/custom_button.dart';

class FoodCatList extends StatelessWidget {
  final List<String> img = [
    'lib/Assets/img/dessert.png',
    'lib/Assets/img/footer_one.png',
    'lib/Assets/img/dessert2.png',
    'lib/Assets/img/footer_six.png',
  ];
  final List<String> titles = ['Dessert', 'Fast Food', 'Dessert', 'Dessert'];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: img.length,
        itemBuilder: (context, index) {
          return Container(
            width: width * 0.4,
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                image: AssetImage(img[index]),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Container(
                height: height * 0.08,
                width: width * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Center(
                  child: Container(
                    height: height*0.04,
                    width: width*0.2,
                    child: CustomButton(
                      content: titles[index],
                      onTap: () {},
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
