import 'package:flutter/material.dart';
import 'package:e_commerce_app/model/product.dart';
import 'package:e_commerce_app/widget/app_color.dart';
import 'package:e_commerce_app/widget/app_assets.dart';
import 'package:e_commerce_app/widget/text_screen.dart';
import 'package:e_commerce_app/widget/product_card.dart';
import 'package:e_commerce_app/widget/icon_button_screen.dart';
import 'package:e_commerce_app/widget/start_rating_widget.dart';
import 'package:e_commerce_app/ui/rating_and_reviews_screen.dart';

class ProductCardScreen extends StatefulWidget {
  const ProductCardScreen({super.key});

  @override
  State<ProductCardScreen> createState() => _ProductCardScreenState();
}

class _ProductCardScreenState extends State<ProductCardScreen> {
  String? _selectedSize;
  bool _isLiked = false;
  bool _isClick = false;
  final List<Product> products = [
    Product(
      imageUrl: AppAssets.imageHome2,
      rating: 3.5,
      brandName: 'Dorothy Perkins',
      itemName: 'Evening Dress',
      oldPrice: '123\$',
      newPrice: '23\$',
      color: 'green',
      size: 'Xl',
    ),
    Product(
      imageUrl: AppAssets.imageMenHoodies,
      rating: 4.0,
      brandName: 'Mango',
      itemName: 'Sporty Dress',
      oldPrice: '75\$',
      newPrice: '45\$',
      color: 'green',
      size: 'Xl',
    ),
    Product(
      imageUrl: AppAssets.imageVisualSearch,
      rating: 5.0,
      brandName: 'Gucci',
      itemName: 'Classic Bag',
      oldPrice: '500\$',
      newPrice: '399\$',
      color: 'green',
      size: 'Xl',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteBackgroundColor,
      appBar: AppBar(
        leading: IconButtonBack(
          iconButtonBack: () {
            Navigator.pop(context);
          },
        ),
        title: TextHeadLine(text: 'Short dress'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share))],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 413,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppAssets.imageMainPage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRectangle('Size', () {
                          showModelBottomSheetSize();
                        }),
                        _buttonRectangle('Black', () {}),
                        Material(
                          color: Colors.white,
                          elevation: 4,
                          shape: const CircleBorder(),
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _isLiked = !_isLiked;
                              });
                            },
                            child: SizedBox(
                              width: 40,
                              height: 40,
                              child: Icon(
                                _isLiked
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: _isLiked ? Colors.red : Colors.grey,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'H&M',
                          style: TextStyle(
                            color: AppColor.blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          '\$19.99',
                          style: TextStyle(
                            color: AppColor.blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: TextItemProduct(text: 'hehe'),
                  ),
                  const Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const StartRatingWidget(startCount: 5, rating: 4),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextDescription(
                      textDescription:
                          'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
                    ),
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Shipping info'),
                        Icon(Icons.arrow_forward_ios_sharp),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RatingAndReviewsScreen(),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Support'),
                          Icon(Icons.arrow_forward_ios_sharp),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),

                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'You can also like this',
                          style: TextStyle(
                            color: AppColor.blackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '12 iteams',
                          style: TextStyle(
                            color: AppColor.grayColor,
                            fontSize: 11,
                          ),
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

          Container(
            height: 100,
            color: AppColor.whiteColor,
            child: Center(
              child: Container(
                height: 50,
                color: AppColor.whiteColor,
                child: ButtonOnclick(
                  textButton: 'ADD TO CART',
                  functionButtonClick: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showModelBottomSheetSize() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: 360,
              color: AppColor.whiteBackgroundColor,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Center(
                    child: Text(
                      'Select size',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: AppColor.blackColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        _buildSizeOption('XS', setState),
                        _buildSizeOption('S', setState),
                        _buildSizeOption('M', setState),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        _buildSizeOption('L', setState),
                        _buildSizeOption('XL', setState),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Size info'),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.keyboard_arrow_right),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ButtonOnclick(
                      textButton: 'ADD TO CART',
                      functionButtonClick: () {
                        print('Kích thước đã chọn: $_selectedSize');
                        Navigator.pop(context);
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

  Widget _buildSizeOption(String size, StateSetter setState) {
    bool isSelected = (_selectedSize == size);
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSize = size;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 90,
          height: 40,
          decoration: BoxDecoration(
            color: isSelected ? AppColor.redColor : Colors.transparent,
            border: Border.all(
              color: isSelected ? AppColor.redColor : AppColor.grayColor,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(
              size,
              style: TextStyle(
                color: isSelected ? AppColor.whiteColor : AppColor.blackColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonRectangle(String text, VoidCallback functionButtonClick) {
    return InkWell(
      onTap: functionButtonClick,
      child: Container(
        width: 138,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.grayColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColor.blackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Icon(Icons.keyboard_arrow_down),
            ],
          ),
        ),
      ),
    );
  }
}
