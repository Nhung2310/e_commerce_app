import 'package:flutter/material.dart';
import 'package:e_commerce_app/ui/home_screen.dart';
import 'package:e_commerce_app/ui/my_bag_screen.dart';
import 'package:e_commerce_app/ui/favorites_screen.dart';
import 'package:e_commerce_app/widget/product_card.dart';
import 'package:e_commerce_app/ui/home/my_home_page.dart';
import 'package:e_commerce_app/ui/shipping_addresses.dart';
import 'package:e_commerce_app/ui/my_checkout_screen.dart';
import 'package:e_commerce_app/ui/product_card_screen.dart';
import 'package:e_commerce_app/ui/payment_cards_screen.dart';
import 'package:e_commerce_app/ui/rating_and_reviews_screen.dart';
import 'package:e_commerce_app/ui/categories/filters_screen.dart';
import 'package:e_commerce_app/ui/categories/catalog1_screen.dart';
import 'package:e_commerce_app/ui/home/home_main_page3_screen.dart';
import 'package:e_commerce_app/ui/home/home_main_page2_screen.dart';
import 'package:e_commerce_app/ui/home/home_main_page1_screen.dart';
import 'package:e_commerce_app/ui/categories/categories_screen.dart';
import 'package:e_commerce_app/ui/categories/categories_screen2.dart';
import 'package:e_commerce_app/ui/visual_search/visual_search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
