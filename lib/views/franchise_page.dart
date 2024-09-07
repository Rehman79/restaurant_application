import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/custom_text.dart';
import 'package:restaurant_app/utils/top_cont.dart';

class FranchisePage extends StatelessWidget {
  const FranchisePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05), // 5% padding
          child: Column(
            children: [
              TopCont(content: 'Our Branches', our_br: false),
              SizedBox(height: screenHeight * 0.05), // 5% vertical spacing
              CustomText(
                content: 'Introducing New Look',
                is_col_white: false,
                is_bold: true,
              ),
              SizedBox(height: screenHeight * 0.02), // Responsive spacing
              Image.asset(
                'lib/Assets/img/rest_two.png',
                height: screenHeight * 0.25, // 25% of screen height
                width: screenWidth * 0.8, // 80% of screen width
                fit: BoxFit.cover,
              ),
              SizedBox(height: screenHeight * 0.02),
              CustomText(content: 'Pouros & Sons', is_col_white: false),
              SizedBox(height: screenHeight * 0.01),
              CustomText(
                  content: '646 First Street, Quigleyville 36427 country',
                  is_col_white: false),
              SizedBox(height: screenHeight * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.redAccent),
                  Icon(Icons.star, color: Colors.redAccent),
                  Icon(Icons.star, color: Colors.redAccent),
                  Icon(Icons.star, color: Colors.redAccent),
                ],
              ),
              SizedBox(height: screenHeight * 0.01),
              CustomText(content: '0321-1234-123', is_col_white: false),
              SizedBox(height: screenHeight * 0.02),
              Image.asset(
                'lib/Assets/img/map.png',
                height: screenHeight * 0.25, // 25% of screen height
                width: screenWidth * 0.8, // 80% of screen width
                fit: BoxFit.cover,
              ),
              SizedBox(height: screenHeight * 0.05),
              CustomText(
                content: 'We Are Now in Bristol',
                is_col_white: false,
                is_bold: true,
              ),
              SizedBox(height: screenHeight * 0.02),
              Image.asset(
                'lib/Assets/img/rest_two.png',
                height: screenHeight * 0.25, // 25% of screen height
                width: screenWidth * 0.8, // 80% of screen width
                fit: BoxFit.cover,
              ),
              SizedBox(height: screenHeight * 0.02),
              CustomText(content: 'Pouros & Sons', is_col_white: false),
              SizedBox(height: screenHeight * 0.01),
              CustomText(
                  content: '646 First Street, Quigleyville 36427 country',
                  is_col_white: false),
              SizedBox(height: screenHeight * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.redAccent),
                  Icon(Icons.star, color: Colors.redAccent),
                  Icon(Icons.star, color: Colors.redAccent),
                  Icon(Icons.star, color: Colors.redAccent),
                ],
              ),
              SizedBox(height: screenHeight * 0.01),
              CustomText(content: '0321-1234-123', is_col_white: false),
            ],
          ),
        ),
      ),
    );
  }
}
