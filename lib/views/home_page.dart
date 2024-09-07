import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/icon_cont.dart';
import 'package:restaurant_app/views/about_page.dart';
import 'package:restaurant_app/views/franchise_page.dart';
import 'package:restaurant_app/views/landing_page.dart';
import 'package:restaurant_app/views/menu_page.dart';

import '../utils/custom_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();


  final List<Widget> _screens = [
    LandingPage(),
    MenuPage(),
    FranchisePage(),
    AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: _screens[_page],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        items: <Widget>[
          IconCont(path: 'lib/Assets/icons/home.png'),
          IconCont(path: 'lib/Assets/icons/menu.png'),
          IconCont(path: 'lib/Assets/icons/franchise.png'),
          IconCont(path: 'lib/Assets/icons/about.png'),
        ],
        color:Theme.of(context).primaryColor.withOpacity(0.6),
        buttonBackgroundColor:Theme.of(context).primaryColor,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}
