import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:e_commerce_app/widget/app_color.dart';
import 'package:e_commerce_app/widget/app_assets.dart';
import 'package:e_commerce_app/widget/text_screen.dart';
import 'package:e_commerce_app/widget/icon_button_screen.dart';
import 'package:e_commerce_app/widget/card_number_formatter.dart';

class MyCheckoutScreen extends StatefulWidget {
  const MyCheckoutScreen({super.key});

  @override
  State<MyCheckoutScreen> createState() => _MyCheckoutScreenState();
}

class _MyCheckoutScreenState extends State<MyCheckoutScreen> {
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
        title: Center(child: TextHeadLineBar(textHeadLine: 'Checkout')),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextHead(textHead: 'Shipping address'),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                color: AppColor.whiteColor,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jane Doe',
                              style: TextStyle(
                                color: AppColor.blackColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                            Wrap(
                              children: [
                                Text(
                                  '3 Newbridge Court Chino Hills, CA 91709, United States',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Change',
                            style: TextStyle(
                              color: AppColor.redColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CardNumberFormatter(),
                ],
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Mastercard-logo.svg/800px-Mastercard-logo.svg.png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                  suffixIcon: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Change',
                      style: TextStyle(
                        color: AppColor.redColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: '**** **** **** ****',
                  labelText: 'Payment',
                  labelStyle: const TextStyle(
                    color: AppColor.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                maxLength: 19,
                onChanged: (value) {},
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextHead(textHead: 'Delivery method'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DeliveryMethod(AppAssets.imageFedex),
                  DeliveryMethod(AppAssets.imageUsps),
                  DeliveryMethod(AppAssets.imageDhl),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Sums('Order:', 14, FontWeight.w700, '112'),
                  Sums('Delivery:', 14, FontWeight.w700, '15'),
                  Sums('Summary:', 16, FontWeight.bold, '127'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonOnclick(
                textButton: 'SUBMIT ORDER',
                functionButtonClick: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget DeliveryMethod(String imageDelivery) {
    return Container(
      height: 72,
      width: 100,
      color: AppColor.whiteColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(imageDelivery),
            width: 32,
            height: 25,
            fit: BoxFit.cover,
          ),
          const Text(
            '2-3 days',
            style: const TextStyle(color: AppColor.grayColor, fontSize: 11),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Sums(String text, double size, FontWeight font, String price) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: AppColor.grayColor,
              fontSize: size,
              fontWeight: font,
            ),
          ),
          Text(
            '$price\$',
            style: TextStyle(
              color: AppColor.blackColor,
              fontSize: size,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
