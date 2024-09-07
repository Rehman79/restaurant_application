import 'package:flutter/material.dart';

class CategoryTabBar extends StatefulWidget {
  @override
  _CategoryTabBarState createState() => _CategoryTabBarState();
}

class _CategoryTabBarState extends State<CategoryTabBar> {
  final List<String> _categories = ['STARTER', 'MAIN COURSE', 'DESSERTS', 'DRINKS'];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Category text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    _categories[index],
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Federo',
                      fontWeight: _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                      color: _selectedIndex == index ? Colors.black : Colors.grey,
                    ),
                  ),
                ),
                _selectedIndex == index
                    ? Container(
                  margin: EdgeInsets.only(top: 5),
                  height: 2,
                  width: 30,
                  color: Colors.green,
                )
                    : Container(),
              ],
            ),
          );
        },
      ),
    );
  }
}
