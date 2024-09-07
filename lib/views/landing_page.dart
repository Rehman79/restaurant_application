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
    final double padding = width * 0.05; // Responsive padding
    final double fontSizeSmall = width * 0.03; // Dynamic font sizes
    final double fontSizeMedium = width * 0.06;
    final double fontSizeLarge = width * 0.08;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSliderWidget(),
            SizedBox(height: height * 0.02), // Responsive height
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    content: 'About us',
                    is_col_white: false,
                    font_size: fontSizeMedium,
                  ),
                  CustomText(
                    content: 'We Create the best',
                    is_col_white: false,
                    font_size: fontSizeLarge,
                  ),
                  CustomText(
                    content: 'foody product',
                    is_col_white: false,
                    font_size: fontSizeLarge,
                  ),
                  CustomText(
                    content: 'Lorem ipsum ' * 10,
                    is_col_white: false,
                    font_size: fontSizeSmall,
                  ),
                  SizedBox(height: height * 0.02),
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
                  SizedBox(height: height * 0.02),
                  Center(
                      child: CustomButton(content: 'Read more', onTap: () {
                        Navigator.pushNamed(context, '/franchisepage');
                      })
                  ),
                  SizedBox(height: height * 0.04),
                  Center(
                    child: CustomText(
                      content: 'Food Category',
                      is_col_white: false,
                      font_size: fontSizeLarge,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  FoodCatList(),
                  SizedBox(height: height * 0.04),
                ],
              ),
            ),
            Container(
              height: height * 0.2,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/Assets/img/rest_3.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                height: height * 0.2,
                width: double.infinity,
                color: Colors.black.withOpacity(0.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      content: 'Book Early & Save',
                      font_size: fontSizeLarge,
                    ),
                    CustomText(
                      content: 'Lorem ipsum' * 2,
                      font_size: fontSizeMedium,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.04),
            Center(
                child: CustomText(
                  content: 'Meet Our Chef',
                  is_col_white: false,
                  font_size: fontSizeLarge,
                )
            ),
            SizedBox(height: height * 0.02),
            ChefList(),
            SizedBox(height: height * 0.03),
            Center(
                child: CustomButton(content: 'Read more', onTap: () {})
            ),
            SizedBox(height: height * 0.03),
            OurServices(),
            SizedBox(height: height * 0.05),
            Center(
              child: CustomButton(
                content: 'Contact Us',
                onTap: () {
                  Navigator.pushNamed(context, '/aboutpage');
                },
              ),
            ),
            SizedBox(height: height * 0.05),
          ],
        ),
      ),
    );
  }
}
