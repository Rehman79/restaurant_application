import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/utils/category_tabbar.dart';
import 'package:restaurant_app/utils/product_list.dart';
import 'package:restaurant_app/utils/top_cont.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopCont(content: 'Menu'),
        SizedBox(height: 20),
        Expanded(
          child: ProductListPage(),
        ),
      ],
    );
  }
}
