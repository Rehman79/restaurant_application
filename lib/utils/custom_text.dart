import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String content;
  final bool fam_federo;
  final bool fam_Dream;
  final bool is_col_white;
  final bool is_bold;
  final double font_size;
  final Color color;

  CustomText(
      {this.fam_federo = true,
      required this.content,
      this.font_size = 20,
      this.color = Colors.white,
      this.fam_Dream = false,
      this.is_col_white = true,
      this.is_bold = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
          color: is_col_white ? color : Colors.black,
          fontSize: font_size,
          fontFamily: fam_federo
              ? 'Federo'
              : fam_Dream
                  ? 'Dreamelly'
                  : 'Montserrat',fontWeight: is_bold?FontWeight.w700:FontWeight.normal),
    );
  }
}
