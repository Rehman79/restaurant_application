import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String content;
  final VoidCallback onTap;

  CustomButton({required this.content, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
        child: Container(
          height: height*0.035,
      width: width*0.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).primaryColor),
          child: Center(child: CustomText(content: content,font_size: 14,)),
    ));
  }
}
