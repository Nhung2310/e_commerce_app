import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce_app/model/product.dart';
import 'package:e_commerce_app/widget/app_color.dart';
import 'package:e_commerce_app/data/product_data.dart';
import 'package:e_commerce_app/widget/app_assets.dart';
import 'package:e_commerce_app/widget/text_screen.dart';
import 'package:e_commerce_app/widget/product_card.dart';
import 'package:e_commerce_app/ui/product_card_screen.dart';
import 'package:e_commerce_app/widget/icon_button_screen.dart';
import 'package:e_commerce_app/services/favorites_service.dart';
import 'package:e_commerce_app/ui/categories/filters_screen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  bool _isView = false;
  String _selectedSortOption = 'Popular';
  String? _selectedSize;

  @override
  Widget build(BuildContext context) {
    final favoritesService = Provider.of<FavoritesService>(context);
    final List<Product> favoriteProducts = favoritesService.favoriteProducts;
    return Scaffold(
      backgroundColor: AppColor.whiteBackgroundColor,
      appBar: _isView
          ? AppBar(
              title: null,
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              ],

              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                    child: TextHeadLine(text: 'Favorites'),
                  ),
                ),
              ),
            )
          : AppBar(
              leading: IconButtonBack(
                iconButtonBack: () {
                  Navigator.of(context).pop();
                },
              ),
              title: Center(child: TextHeadLine(text: 'Favorites')),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              ],
            ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 60,

              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ButtonCatalog(text: 'T-shirts', onTap: () {}),
                  ButtonCatalog(text: 'Crop tops', onTap: () {}),
                  ButtonCatalog(text: 'Sleeveless', onTap: () {}),
                  ButtonCatalog(text: 'T-shirts', onTap: () {}),
                  ButtonCatalog(text: 'Crop tops', onTap: () {}),
                  ButtonCatalog(text: 'Sleeveless', onTap: () {}),
                ],
              ),
            ),
            Container(
              height: 40,
              color: AppColor.whiteBackgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  FiltersButton(
                    iconButton: const Icon(Icons.filter_list),
                    text: 'Filters',
                    functionButtonClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FiltersScreen(),
                        ),
                      );
                    },
                  ),

                  FiltersButton(
                    iconButton: const Icon(Icons.swap_vert),
                    text: _selectedSortOption,
                    functionButtonClick: () {
                      _showSortOptions();
                    },
                  ),

                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isView = !_isView;
                      });
                    },
                    icon: _isView
                        ? const Icon(Icons.view_module)
                        : const Icon(Icons.view_list),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),
            favoriteProducts.isEmpty
                ? const Expanded(
                    child: const Center(child: const Text('No empty')),
                  )
                : _isView
                ? Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: favoriteProducts.map<Widget>((product) {
                                return ProductCardListViewFavorites(
                                  product: product,
                                  textLabel: '',
                                  colorTextLabel: AppColor.whiteColor,
                                  colorLabel: AppColor.redColorBox,
                                  onTap: () {},
                                  onDoubleTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProductCardScreen(product: product),
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 10.0,

                              childAspectRatio: 150 / 300,
                            ),
                        itemCount: favoriteProducts.length,
                        itemBuilder: (context, index) {
                          final product = favoriteProducts[index];
                          return ProductCardGridViewFavorites(
                            product: product,
                            onTap: () {},
                            onDoubleTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductCardScreen(product: product),
                                ),
                              );
                            },

                            colorTextLabel: AppColor.whiteColor,
                            colorLabel: Colors.transparent,
                            textLabel: '',
                          );
                        },
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  void _showSortOptions() {
    final List<String> sortOptions = [
      'Popular',
      'Newest',
      'Customer review',
      'Price: lowest to high',
      'Price: highest to low',
    ];

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setStateBottomSheet) {
            return SizedBox(
              height: 350,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Sort by',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: sortOptions.length,
                      itemBuilder: (context, index) {
                        final optionText = sortOptions[index];
                        final bool isSelected =
                            _selectedSortOption == optionText;

                        return InkWell(
                          onTap: () {
                            setStateBottomSheet(() {
                              _selectedSortOption = optionText;
                            });

                            setState(() {
                              _selectedSortOption = optionText;
                            });
                            Navigator.pop(context);
                          },
                          child: TextSortBy(
                            text: optionText,
                            backgroundColor: isSelected
                                ? AppColor.redColor
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
