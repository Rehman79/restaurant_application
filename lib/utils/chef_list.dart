import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/custom_text.dart';

class ChefList extends StatelessWidget {
  const ChefList({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery
        .of(context)
        .size
        .height;
    final double width = MediaQuery
        .of(context)
        .size
        .width;
    return Container(
        height: height * 0.3,
        child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            width: width * 0.5,
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                image: AssetImage('lib/Assets/img/chef.png'),
                fit: BoxFit.cover,
              ),
            ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  child: Container(
                    width: width*0.3,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        CustomText(content: 'D.Estwood',is_col_white: false,),
                        CustomText(content: 'Chief chef',is_col_white: false,fam_federo: false,fam_Dream: false,font_size: 14,is_bold: true,),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          );
        })
    );
  }
  }
