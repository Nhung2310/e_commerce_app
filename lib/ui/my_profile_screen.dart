import 'package:flutter/material.dart';
import 'package:e_commerce_app/widget/app_color.dart';
import 'package:e_commerce_app/widget/app_assets.dart';
import 'package:e_commerce_app/widget/text_screen.dart';
import 'package:e_commerce_app/ui/my_orders_screen.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [const Icon(Icons.search, color: AppColor.blackColor)],
        flexibleSpace: FlexibleSpaceBar(
          title: TextHeadLine(text: 'My profile'),
        ),
      ),
      body: Column(
        children: [
          const Row(
            children: [
              CircleAvatar(child: Image(image: AssetImage(AppAssets.avatar))),
              Column(
                children: [
                  Text(
                    'ChangNhung',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'test@gmail.com',
                    style: TextStyle(fontSize: 14, color: AppColor.grayColor),
                  ),
                ],
              ),
            ],
          ),
          _tabBarMyProfile('My orders', 'Already have 12 orders', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyOrdersScreen()),
            );
          }),
          _tabBarMyProfile('Shipping addresses', '3 ddresses', () {}),
          _tabBarMyProfile('Payment methods', 'Visa  **34', () {}),
          _tabBarMyProfile('Promocodes', 'You have special promocodes', () {}),
          _tabBarMyProfile('My reviews', 'Reviews for 4 items', () {}),
          _tabBarMyProfile('Settings', 'Notifications, password', () {}),
        ],
      ),
    );
  }

  Widget _tabBarMyProfile(String text1, String text2, Function _onTap) {
    return InkWell(
      onTap: () {
        _onTap();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text(
                  text1,
                  style: const TextStyle(
                    color: AppColor.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  text2,
                  style: const TextStyle(
                    color: AppColor.grayColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.chevron_right,
              color: AppColor.grayColor,
              size: 12,
            ),
          ],
        ),
      ),
    );
  }
}
