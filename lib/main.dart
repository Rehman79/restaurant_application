import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/Models/cart_model.dart'; // Import CartModel
import 'package:restaurant_app/views/Cart_page.dart';
import 'package:restaurant_app/views/about_page.dart';
import 'package:restaurant_app/views/checkout_page.dart';
import 'package:restaurant_app/views/contact_page.dart';
import 'package:restaurant_app/views/franchise_page.dart';
import 'package:restaurant_app/views/home_page.dart';
import 'package:restaurant_app/views/landing_page.dart';
import 'package:restaurant_app/views/menu_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CartModel()), // Add CartModel provider
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF00BCA8),  // 00BCA8
        scaffoldBackgroundColor: Color(0xFFFFFFFF),  // ffffff
        shadowColor: Color(0xFF333333),  // 333333
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF000000)),  // 000000
        appBarTheme: AppBarTheme(
          color: Color(0xFF000000),  // 00BCA8
          titleTextStyle: TextStyle(
            color: Color(0xFFFFFFFF),  // ffffff
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: Color(0xFFFFFFFF),  // ffffff
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFF00BCA8),  // 00BCA8
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      routes: {
        '/landing_page': (context) => LandingPage(),
        '/homepage':(context)=>HomePage(),
        '/menupage':(context)=>MenuPage(),
        '/franchisepage':(context)=>FranchisePage(),
        '/aboutpage':(context)=>AboutPage(),
        '/contactpage':(context)=>ContactPage(),
        '/checkoutpage':(context)=>CheckoutPage(),
        '/cartpage':(context)=>CartPage(),
      },
      initialRoute: '/homepage',
    ),
  ));
}
