import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/custom_text.dart';
import 'package:restaurant_app/utils/top_cont.dart';

class FranchisePage extends StatelessWidget {
  const FranchisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TopCont(content: 'Our Branches',our_br: false,),
                SizedBox(height: 50,),
                CustomText(content: 'Introducing New Look',is_col_white: false,is_bold: true,),
                SizedBox(height: 10,),
                Image.asset('lib/Assets/img/rest_two.png',height: 200,fit: BoxFit.cover,width: 450,),
                SizedBox(height: 10,),
                CustomText(content: 'Pouros & Sons',is_col_white: false),
                SizedBox(height: 10,),
                CustomText(content: '646 First Street,Quigleyville 36427 country',is_col_white: false),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star,color: Colors.redAccent,),
                    Icon(Icons.star,color: Colors.redAccent,),
                    Icon(Icons.star,color: Colors.redAccent,),
                    Icon(Icons.star,color: Colors.redAccent,),
                  ],
                ),
                SizedBox(height: 10,),
                CustomText(content: '0321-1234-123',is_col_white: false),
                SizedBox(height: 10,),
                Image.asset('lib/Assets/img/map.png',height: 200,fit: BoxFit.cover,width: 450,),
                SizedBox(height: 50,),
                CustomText(content: 'We Are Now in Bristol',is_col_white: false,is_bold: true,),
                SizedBox(height: 10,),
                Image.asset('lib/Assets/img/rest_two.png',height: 200,fit: BoxFit.cover,width: 450,),
                SizedBox(height: 10,),
                CustomText(content: 'Pouros & Sons',is_col_white: false),
                SizedBox(height: 10,),
                CustomText(content: '646 First Street,Quigleyville 36427 country',is_col_white: false),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star,color: Colors.redAccent,),
                    Icon(Icons.star,color: Colors.redAccent,),
                    Icon(Icons.star,color: Colors.redAccent,),
                    Icon(Icons.star,color: Colors.redAccent,),
                  ],
                ),
                SizedBox(height: 10,),
                CustomText(content: '0321-1234-123',is_col_white: false),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
