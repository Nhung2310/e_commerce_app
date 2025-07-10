import 'package:flutter/material.dart';
import 'package:e_commerce_app/widget/app_color.dart';
import 'package:e_commerce_app/widget/app_assets.dart';
import 'package:e_commerce_app/ui/settings_screen.dart';
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
        actions: const [Icon(Icons.search, color: AppColor.blackColor)],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: TextHeadLine(text: 'My profile'),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(AppAssets.avatar),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
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
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColor.grayColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
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
          _tabBarMyProfile('Settings', 'Notifications, password', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsScreen()),
            );
          }),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

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
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.chevron_right,
              color: AppColor.grayColor,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
