import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/custom_text.dart';

class TopCont extends StatelessWidget {
  const TopCont({super.key, required this.content, this.our_br=true});

  final String content;
  final bool our_br;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.2,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image:our_br?AssetImage('lib/Assets/img/deliciousmeal_one.png'):AssetImage('lib/Assets/img/rest_3.png'),
            fit: BoxFit.cover),
      ),
      child: Container(
        color: Colors.black.withOpacity(0.4),
          child: Center(
            child: CustomText(
                    content: content,
                    is_col_white: true,
                    font_size: 30,
                  ),
          )),
    );
  }
}
