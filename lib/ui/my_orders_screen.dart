import 'package:flutter/material.dart';
import 'package:e_commerce_app/widget/app_color.dart';
import 'package:e_commerce_app/widget/text_screen.dart';
import 'package:e_commerce_app/widget/icon_button_screen.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButtonBack(
          iconButtonBack: () {
            Navigator.pop(context);
          },
        ),
        actions: const [Icon(Icons.search)],
        flexibleSpace: FlexibleSpaceBar(title: TextHeadLine(text: 'My Order')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buttonTags('Delivered'),
                _buttonTags('Processing'),
                _buttonTags('Cancelled'),
              ],
            ),
          ),
          _orderCard('Order №1947034', '05-12-2019', 'IW3475453455', 3, 125),
          _orderCard('Order №1947034', '05-12-2019', 'IW3475453455', 3, 125),
          _orderCard('Order №1947034', '05-12-2019', 'IW3475453455', 3, 125),
          _orderCard('Order №1947034', '05-12-2019', 'IW3475453455', 3, 125),
        ],
      ),
    );
  }

  Widget _buttonTags(String text) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(backgroundColor: AppColor.blackColor),
      child: Text(
        text,
        style: const TextStyle(color: AppColor.whiteColor, fontSize: 14),
      ),
    );
  }

  Widget _orderCard(
    String order,
    String dateTime,
    String number,
    int quantity,
    double amount,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    order,
                    style: const TextStyle(
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    dateTime,
                    style: const TextStyle(
                      color: AppColor.grayColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'Tracking number:',
                    style: TextStyle(color: AppColor.grayColor, fontSize: 14),
                  ),
                  Text(
                    number,
                    style: const TextStyle(
                      color: AppColor.blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'Quantity:',
                    style: TextStyle(color: AppColor.grayColor, fontSize: 14),
                  ),
                  Text(
                    '$quantity',
                    style: const TextStyle(
                      color: AppColor.blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Total Amount:',
                    style: TextStyle(color: AppColor.grayColor, fontSize: 14),
                  ),
                  Text(
                    '$amount\$',
                    style: const TextStyle(
                      color: AppColor.blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColor.blackColor),
                    ),
                    child: const Text(
                      'Details',
                      style: const TextStyle(
                        color: AppColor.blackColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const Text(
                    'Delivered',
                    style: const TextStyle(
                      color: AppColor.green,
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
    );
  }
}
