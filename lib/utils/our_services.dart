import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/custom_text.dart';
import 'package:restaurant_app/utils/our_ser_col.dart';

class OurServices extends StatelessWidget {
  const OurServices({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      color: Theme.of(context).primaryColor.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            CustomText(content: 'Our Services',is_col_white: false,font_size: 28,),
            SizedBox(height: 30,),
            Container(
              width: width*0.8,
              child: Column(
                children: [
                  OurSerCol(icon: 'lib/Assets/icons/food-delivery.png', main_heading: 'Concierge Service', sub_heading: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore'),
                  SizedBox(height: 20,),
                  OurSerCol(icon: 'lib/Assets/icons/table-etiquette.png', main_heading: 'Dining', sub_heading: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tellus odio, accumsan sit amet ullamcorper quis,'),
                  SizedBox(height: 20,),
                  OurSerCol(icon: 'lib/Assets/icons/calendar.png', main_heading: 'Restaurant', sub_heading: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tellus odio, accumsan sit amet ullamcorper quis,'),
                  SizedBox(height: 40,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
