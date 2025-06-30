import 'package:flutter/material.dart';
import 'package:e_commerce_app/widget/app_color.dart';
import 'package:e_commerce_app/widget/app_assets.dart';
import 'package:e_commerce_app/widget/text_screen.dart';
import 'package:e_commerce_app/widget/icon_button_screen.dart';

class TakingAPhotoScreen extends StatefulWidget {
  const TakingAPhotoScreen({super.key});

  @override
  State<TakingAPhotoScreen> createState() => _TakingAPhotoScreenState();
}

class _TakingAPhotoScreenState extends State<TakingAPhotoScreen> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButtonBack(
          iconButtonBack: () {
            Navigator.pop(context);
          },
        ),

        title: Center(
          child: TextHeadLineBar(textHeadLine: 'Search by taking a photo'),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.imageVisualSearch),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: AppColor.redColor,
        selectedIndex: currentPageIndex,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.flash_on), label: ''),
          NavigationDestination(icon: Icon(Icons.camera_alt), label: ''),
          NavigationDestination(icon: Icon(Icons.sync), label: ''),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(items: [
      //   BottomNavigationBarItem(icon: )
      // ]),
    );
  }
}
