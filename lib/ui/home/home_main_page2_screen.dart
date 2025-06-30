import 'package:flutter/services.dart';
import 'package:flutter/material.dart' hide Title;
import 'package:e_commerce_app/model/product.dart';
import 'package:e_commerce_app/widget/app_color.dart';
import 'package:e_commerce_app/widget/app_assets.dart';
import 'package:e_commerce_app/widget/text_screen.dart';
import 'package:e_commerce_app/widget/product_card.dart';

class HomeMainPage2Screen extends StatelessWidget {
  const HomeMainPage2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        imageUrl: AppAssets.imageHome2,
        rating: 3.5,
        brandName: 'Dorothy Perkins',
        itemName: 'Evening Dress',
        oldPrice: '123\$',
        newPrice: '23\$',
      ),
      Product(
        imageUrl: AppAssets.imageMenHoodies,
        rating: 4.0,
        brandName: 'Mango',
        itemName: 'Sporty Dress',
        oldPrice: '75\$',
        newPrice: '45\$',
      ),
      Product(
        imageUrl: AppAssets.imageVisualSearch,
        rating: 5.0,
        brandName: 'Gucci',
        itemName: 'Classic Bag',
        oldPrice: '500\$',
        newPrice: '399\$',
      ),
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: AppColor.whiteBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 196,
                width: 376,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets.imageHome2),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [TextMainPage(textMainPage: 'Street clothes')],
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
                        TextTitle(text: 'Sale', color: AppColor.blackColor),
                        Subtitle(text: 'View all'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Subtitle(text: 'Super summer sale')],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    SizedBox(
                      height: 300,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: products.map((product) {
                          return ProductCard(
                            product: product,
                            textLabel: '-20%',
                            colorTextLabel: AppColor.whiteColor,
                            colorLabel: AppColor.redColorBox,
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextTitle(text: 'New', color: AppColor.blackColor),
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
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    SizedBox(
                      height: 300,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: products.map((product) {
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
