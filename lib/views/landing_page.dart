import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/carousel_slider_widget.dart';
import 'package:restaurant_app/utils/chef_list.dart';
import 'package:restaurant_app/utils/custom_appbar.dart';
import 'package:restaurant_app/utils/custom_button.dart';
import 'package:restaurant_app/utils/custom_text.dart';
import 'package:restaurant_app/utils/food_cat_list.dart';
import 'package:restaurant_app/utils/our_services.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSliderWidget(),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    content: 'About us',
                    is_col_white: false,
                    font_size: 20,
                  ),
                  CustomText(
                    content: 'We Create the best',
                    is_col_white: false,
                    font_size: 25,
                  ),
                  CustomText(
                    content: 'foody product',
                    is_col_white: false,
                    font_size: 25,
                  ),
                  CustomText(
                    content: 'Lorem ipsum ' * 10,
                    is_col_white: false,
                    font_size: 12,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: height * 0.1,
                        width: width * 0.4,
                        child: Image.asset(
                          'lib/Assets/img/footer_two.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: height * 0.1,
                        width: width * 0.4,
                        child: Image.asset(
                          'lib/Assets/img/footer_four.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Center(
                      child: CustomButton(content: 'Read more', onTap: () {})),
                  SizedBox(height: 30),
                  Center(
                      child: CustomText(
                          content: 'Food Category',
                          is_col_white: false,
                          font_size: 24)),
                  SizedBox(height: 10),
                  FoodCatList(),
                  SizedBox(height: 30),
                ],
              ),
            ),
            Container(
              height: height * 0.2,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/Assets/img/rest_3.png'),
                      fit: BoxFit.cover)),
              child:Container(
                height: height * 0.2,
                width: double.infinity,
                color: Colors.black.withOpacity(0.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      content: 'Book Early & Save',
                      font_size: 30,
                    ),
                    CustomText(
                      content: 'Lorem ipsum' * 2,
                      font_size: 20,
                    ),
                  ],
                ),
              )
            ),
            SizedBox(height: 30,),
            Center(child: CustomText(content: 'Meet Our Chef',is_col_white: false,font_size: 24,)),
            SizedBox(height: 10,),
            ChefList(),
            SizedBox(height: 20,),
            Center(
                child: CustomButton(content: 'Read more', onTap: () {})),
            SizedBox(height: 20,),
            OurServices(),
            SizedBox(height: 40,),
            Center(child: CustomButton(content: 'Contact Us', onTap: (){})),
            SizedBox(height: 40,)
          ],
        ),
      ),
      // bottomNavigationBar: CustomBnb(),
    );
  }
}
