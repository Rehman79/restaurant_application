import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class OurSerCol extends StatelessWidget {
  final String icon;

  OurSerCol({required this.icon, required this.main_heading, required this.sub_heading});

  final String main_heading;
  final String sub_heading;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(icon,height: 50,width: 50,),
        CustomText(content: main_heading,is_col_white: false,),
        CustomText(content: sub_heading,is_col_white: false,font_size: 14,),
      ],
    );
  }
}
