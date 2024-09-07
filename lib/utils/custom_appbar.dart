import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/custom_text.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              content: 'English v',
              font_size: 14,
            ),
            Icon(Icons.abc),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/aboutpage');
              },
              child: Image.asset(
                'lib/Assets/icons/contact-mail.png',color: Colors.white,height: 30,width: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
