import 'package:flutter/material.dart';
import 'package:e_commerce_app/widget/app_color.dart';
import 'package:e_commerce_app/widget/app_assets.dart';
import 'package:e_commerce_app/widget/text_screen.dart';
import 'package:e_commerce_app/widget/icon_button_screen.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.imageSuccess),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextHeadLine(text: 'Success!'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextHeadLineBar(
              textHeadLine: 'Your order will be delivered soon.',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextHeadLineBar(
              textHeadLine: ' Thank you for choosing our app!',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonOnclick(
              textButton: 'Continue shopping',
              functionButtonClick: () {},
            ),
          ),
        ],
      ),
    );
  }
}
