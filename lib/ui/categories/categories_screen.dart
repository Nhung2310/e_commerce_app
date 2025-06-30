import 'package:flutter/material.dart';
import 'package:e_commerce_app/widget/app_color.dart';
import 'package:e_commerce_app/widget/app_assets.dart';
import 'package:e_commerce_app/widget/text_screen.dart';
import 'package:e_commerce_app/widget/icon_button_screen.dart';
import 'package:e_commerce_app/ui/categories/categories_screen2.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButtonBack(
            iconButtonBack: () {
              Navigator.of(context).pop();
            },
          ),
          title: Center(child: TextHeadLine(text: 'Categories')),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          ],

          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: 'Women'),
              Tab(text: 'Men'),
              Tab(text: 'Kids'),
            ],

            indicatorColor: AppColor.redColor,
            labelColor: AppColor.blackColor,
            unselectedLabelColor: Colors.grey,
          ),
        ),

        body: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 16.0,
              ),
              color: Colors.red,
              width: double.infinity,
              child: const Column(
                children: [
                  Text(
                    'SUMMER SALES',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Up to 50% off',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(
                children: <Widget>[
                  listCardCategories(context),
                  const SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                Text(
                                  'New',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                                Image(image: AssetImage(AppAssets.imageNew)),
                              ],
                            ),
                          ),
                          Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Clothes',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                                Image(
                                  image: AssetImage(AppAssets.imageClothes),
                                ),
                              ],
                            ),
                          ),
                          Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Shoes',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                                Image(image: AssetImage(AppAssets.imageShoes)),
                              ],
                            ),
                          ),
                          Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Accesories',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                                Image(
                                  image: AssetImage(AppAssets.imageAccesories),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                Text(
                                  'New',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                                Image(image: AssetImage(AppAssets.imageNew)),
                              ],
                            ),
                          ),
                          Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Clothes',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                                Image(
                                  image: AssetImage(AppAssets.imageClothes),
                                ),
                              ],
                            ),
                          ),
                          Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Shoes',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                                Image(image: AssetImage(AppAssets.imageShoes)),
                              ],
                            ),
                          ),
                          Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Accesories',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                                Image(
                                  image: AssetImage(AppAssets.imageAccesories),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget listCardCategories(BuildContext context) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CategoriesScreen2(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  TextCategoriesCard(text: 'New'),

                  const Image(image: AssetImage(AppAssets.imageNew)),
                ],
              ),
            ),
          ),
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextCategoriesCard(text: 'Clothes'),

                const Image(image: AssetImage(AppAssets.imageClothes)),
              ],
            ),
          ),
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextCategoriesCard(text: 'Shoes'),

                const Image(image: const AssetImage(AppAssets.imageShoes)),
              ],
            ),
          ),
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextCategoriesCard(text: 'Accesories'),

                const Image(image: const AssetImage(AppAssets.imageAccesories)),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
