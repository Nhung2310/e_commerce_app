import 'package:flutter/material.dart';
import 'package:e_commerce_app/widget/app_color.dart';

class FindingScreen extends StatelessWidget {
  const FindingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search, size: 62, color: AppColor.redColor),
            SizedBox(height: 16),
            Text(
              'Finding similar results...',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColor.blackColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
