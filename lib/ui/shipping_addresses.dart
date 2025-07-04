import 'package:flutter/material.dart';
import 'package:e_commerce_app/widget/app_color.dart';
import 'package:e_commerce_app/widget/text_screen.dart';
import 'package:e_commerce_app/ui/add_shipping_address.dart';
import 'package:e_commerce_app/widget/icon_button_screen.dart';

class ShippingAddresses extends StatefulWidget {
  const ShippingAddresses({super.key});

  @override
  State<ShippingAddresses> createState() => _ShippingAddressesState();
}

class _ShippingAddressesState extends State<ShippingAddresses> {
  bool _isCheckedShipp = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButtonBack(
          iconButtonBack: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: TextHeadLineBar(textHeadLine: 'Shipping Addresses'),
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddShippingAddress()),
          );
        },
        child: const Icon(Icons.add, size: 24, color: AppColor.whiteColor),
        backgroundColor: AppColor.blackColor,
        shape: const CircleBorder(),
      ),
      body: Column(
        children: [_cardShipping(), _cardShipping(), _cardShipping()],
      ),
    );
  }

  Widget _cardShipping() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width - 32,
        child: Card(
          color: AppColor.whiteColor,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Jane Doe',
                        style: TextStyle(
                          color: AppColor.blackColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const Wrap(
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: _isCheckedShipp,
                            onChanged: (bool? value) {
                              setState(() {
                                _isCheckedShipp = value!;
                              });
                            },
                            checkColor: AppColor.whiteColor,
                            fillColor: WidgetStateProperty.resolveWith<Color?>((
                              states,
                            ) {
                              if (states.contains(WidgetState.selected)) {
                                return AppColor.blackColor;
                              }
                              return AppColor.whiteColor;
                            }),
                            side: const BorderSide(color: AppColor.grayColor),
                          ),
                          const Text('Use as the shipping address'),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),

                const Row(
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
    );
  }
}
