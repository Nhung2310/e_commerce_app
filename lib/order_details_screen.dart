import 'package:flutter/material.dart';
import 'package:e_commerce_app/widget/app_color.dart';
import 'package:e_commerce_app/data/product_data.dart';
import 'package:e_commerce_app/widget/text_screen.dart';
import 'package:e_commerce_app/widget/product_card.dart';
import 'package:e_commerce_app/widget/icon_button_screen.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButtonBack(
          iconButtonBack: () {
            Navigator.pop(context);
          },
        ),
        title: TextHeadLineBar(textHeadLine: 'Order Details'),
        actions: const [Icon(Icons.search)],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order №1947034',
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '05-12-2019',
                    style: TextStyle(color: AppColor.grayColor, fontSize: 12),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Tracking number:',
                        style: TextStyle(
                          color: AppColor.grayColor,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'IW3475453455',
                        style: TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Delivered',
                    style: TextStyle(
                      color: AppColor.green,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Text(
                '${mockProducts.length} items',
                style: const TextStyle(
                  color: AppColor.blackColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Column(
                children: mockProducts.map<Widget>((product) {
                  return ProductCardOrder(
                    product: product,
                    textLabel: '',
                    colorTextLabel: AppColor.whiteColor,
                    colorLabel: AppColor.redColorBox,
                  );
                }).toList(),
              ),
              const Text(
                'Order information',
                style: TextStyle(
                  color: AppColor.blackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const RichTextInformationOrder(
                textItem: 'Shipping Address:',
                textDetailItem:
                    '3 Newbridge Court ,Chino Hills, CA 91709, United States',
              ),
              const RichTextInformationOrder(
                textItem: 'Payment method:',
                textDetailItem: '**** **** **** 3947',
              ),
              const RichTextInformationOrder(
                textItem: 'Delivery method:',
                textDetailItem: 'FedEx, 3 days, 15\$',
              ),
              const RichTextInformationOrder(
                textItem: 'Discount:',
                textDetailItem: '10%, Personal promo code',
              ),
              const RichTextInformationOrder(
                textItem: 'Total Amount:',
                textDetailItem: '133\$',
              ),

              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColor.blackColor),
                      ),
                      child: const Text(
                        'Reorder',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColor.blackColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.redColor,
                      ),
                      child: const Text(
                        'Leave feedback',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
