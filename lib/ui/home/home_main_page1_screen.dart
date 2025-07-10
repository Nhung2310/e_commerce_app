import 'package:flutter/services.dart';
import 'package:flutter/material.dart' hide Title;
import 'package:e_commerce_app/model/product.dart';
import 'package:e_commerce_app/widget/app_color.dart';
import 'package:e_commerce_app/data/product_data.dart';
import 'package:e_commerce_app/widget/app_assets.dart';
import 'package:e_commerce_app/widget/text_screen.dart';
import 'package:e_commerce_app/widget/product_card.dart';

class HomeMainPageScreen extends StatelessWidget {
  const HomeMainPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: AppColor.whiteBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              FittedBox(
                child: Container(
                  padding: const EdgeInsets.all(12.0),

                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppAssets.imageMainPage),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      TextMainPage(textMainPage: 'Fashion'),
                      TextMainPage(textMainPage: 'sale'),
                      const SizedBox(height: 16),

                      ElevatedButton(
                        onPressed: () {},

                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.redColorBox,
                          fixedSize: const Size(160, 36),
                          shadowColor: AppColor.redColorBox.withAlpha(64),
                        ),
                        child: const WhiteText(text: 'Check'),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            TextTitle(text: 'New', color: AppColor.blackColor),
                          ],
                        ),
                        Subtitle(text: 'View all'),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Subtitle(text: 'You’ve never seen it before!'),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 300,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: mockProducts.map((product) {
                          return ProductCard(
                            product: product,
                            textLabel: 'New',
                            colorTextLabel: AppColor.whiteColor,
                            colorLabel: AppColor.blackColor,
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
