import 'package:flutter/material.dart';
import 'package:e_commerce_app/ui/home/home_main_page1_screen.dart';
import 'package:e_commerce_app/ui/home/home_main_page2_screen.dart';
import 'package:e_commerce_app/ui/home/home_main_page3_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController _controller;
  int _curr = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            _curr = index;
          });
        },
        children: const [
          Center(child: HomeMainPageScreen()),
          Center(child: HomeMainPage2Screen()),
          Center(child: HomeMainPage3Screen()),
        ],
      ),
    );
  }
}
