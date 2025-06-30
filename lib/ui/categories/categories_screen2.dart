import 'package:flutter/material.dart';
import 'package:e_commerce_app/widget/text_screen.dart';
import 'package:e_commerce_app/widget/icon_button_screen.dart';
import 'package:e_commerce_app/ui/categories/catalog1_screen.dart';

class CategoriesScreen2 extends StatefulWidget {
  const CategoriesScreen2({super.key});

  @override
  State<CategoriesScreen2> createState() => _CategoriesScreen2State();
}

class _CategoriesScreen2State extends State<CategoriesScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButtonBack(
          iconButtonBack: () {
            Navigator.of(context).pop();
          },
        ),
        title: Center(child: TextHeadLine(text: 'Categories')),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ButtonOnclick(
              textButton: 'VIEW ALL ITEMS',
              functionButtonClick: () {},
            ),
            const SizedBox(height: 8),
            Subtitle(text: 'Choose category'),
            const SizedBox(height: 8),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Catalog1Screen(),
                          ),
                        );
                      },
                      child: TextListCategories(text: 'Tops'),
                    ),
                    const Divider(),
                    TextListCategories(text: 'Shirts & Blouses'),
                    const Divider(),
                    TextListCategories(text: 'Cardigans & Sweaters'),
                    const Divider(),
                    TextListCategories(text: 'Knitwear'),
                    const Divider(),
                    TextListCategories(text: 'Blazers'),
                    const Divider(),
                    TextListCategories(text: 'Outerwear'),
                    const Divider(),
                    TextListCategories(text: 'Pants'),
                    const Divider(),
                    TextListCategories(text: 'Jeans'),
                    const Divider(),
                    TextListCategories(text: 'Shorts'),
                    const Divider(),
                    TextListCategories(text: 'Skirts'),
                    const Divider(),
                    TextListCategories(text: 'Dresses'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
