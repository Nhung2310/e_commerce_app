import 'package:flutter/material.dart';
import 'package:e_commerce_app/model/product.dart';
import 'package:e_commerce_app/widget/app_color.dart';
import 'package:e_commerce_app/data/product_data.dart';
import 'package:e_commerce_app/widget/app_assets.dart';
import 'package:e_commerce_app/widget/text_screen.dart';
import 'package:e_commerce_app/widget/product_card.dart';
import 'package:e_commerce_app/ui/my_checkout_screen.dart';
import 'package:e_commerce_app/widget/icon_button_screen.dart';

class MyBagScreen extends StatefulWidget {
  const MyBagScreen({super.key});

  @override
  State<MyBagScreen> createState() => _MyBagScreenState();
}

class _MyBagScreenState extends State<MyBagScreen> {
  final TextEditingController _promoCodeController = TextEditingController();
  bool _hasText = false;

  @override
  void dispose() {
    _promoCodeController.removeListener(_onPromoCodeChanged);
    _promoCodeController.dispose();
    super.dispose();
  }

  void _onPromoCodeChanged() {
    setState(() {
      _hasText = _promoCodeController.text.isNotEmpty;
    });
  }

  void _clearPromoCode() {
    _promoCodeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteBackgroundColor,
      appBar: AppBar(
        title: null,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: TextHeadLineBar(textHeadLine: 'My Bag'),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: mockProducts.map<Widget>((product) {
                  return ProductCardListViewMyBag(
                    product: product,
                    textLabel: '',
                    colorTextLabel: AppColor.whiteColor,
                    colorLabel: AppColor.redColorBox,
                    onDeleteProduct: () {},
                    onTapCard: () {},
                  );
                }).toList(),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Positioned(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 20, 8),
                              child: TextFormField(
                                controller: _promoCodeController,
                                decoration: InputDecoration(
                                  hintText: 'Enter your promo code',
                                  fillColor: AppColor.whiteColor,
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: const EdgeInsets.fromLTRB(
                                    8,
                                    8,
                                    8,
                                    8,
                                  ),
                                  filled: true,
                                  suffixIcon: _hasText
                                      ? IconButton(
                                          icon: const Icon(
                                            Icons.close,
                                            color: AppColor.grayColor,
                                          ),
                                          onPressed: _clearPromoCode,
                                        )
                                      : null,
                                ),
                              ),
                            ),
                          ),
                          if (!_hasText)
                            Positioned(
                              bottom: 8,
                              right: 0,
                              child: ElevatedButton(
                                onPressed: () {
                                  showModelBottomSheetPromoCodes(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),

                                  iconColor: AppColor.whiteColor,
                                  backgroundColor: AppColor.blackColor,
                                ),
                                child: const Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: const Icon(
                                    Icons.arrow_forward,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total amount:',
                      style: TextStyle(color: AppColor.grayColor, fontSize: 12),
                    ),
                    Text(
                      '22\$',
                      style: TextStyle(
                        color: AppColor.blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonOnclick(
                    textButton: 'CHECK OUT',
                    functionButtonClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyCheckoutScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showModelBottomSheetPromoCodes(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setStateInBottomSheet) {
            return FractionallySizedBox(
              heightFactor: 0.8,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: AppColor.whiteBackgroundColor,
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Positioned(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                        8,
                                        8,
                                        20,
                                        8,
                                      ),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: 'Enter your promo code',
                                          fillColor: AppColor.whiteColor,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            borderSide: BorderSide.none,
                                          ),
                                          contentPadding: EdgeInsets.fromLTRB(
                                            8,
                                            8,
                                            8,
                                            8,
                                          ),
                                          filled: true,
                                        ),
                                      ),
                                    ),
                                  ),

                                  Positioned(
                                    bottom: 8,
                                    right: 0,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        shape: const CircleBorder(),

                                        iconColor: AppColor.whiteColor,
                                        backgroundColor: AppColor.blackColor,
                                      ),
                                      child: const Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: const Icon(
                                          Icons.arrow_forward,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 8),
                          child: TextItemProduct(text: 'Your Promo Codes'),
                        ),
                        promoCodeDetail(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget promoCodeDetail() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Container(
        height: 80,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.whiteColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 80,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                color: AppColor.redColor,
              ),
              child: Center(
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.baseline,
                  // textBaseline: TextBaseline.alphabetic,
                  children: [
                    TextDiscount(text: '10', sizeText: 34),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextDiscount(text: '%', sizeText: 14),
                        const SizedBox.shrink(),
                        TextDiscount(text: 'off', sizeText: 16),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: const Column(
                children: [
                  Text(
                    'Personal offer',
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'mypromocode2020',
                    style: TextStyle(fontSize: 11, color: AppColor.blackColor),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  const Text(
                    '6 day remaining',
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColor.grayColor,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Apply',
                      style: TextStyle(color: AppColor.whiteColor),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.redColor,
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
