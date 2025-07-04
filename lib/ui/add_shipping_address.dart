import 'package:flutter/material.dart';
import 'package:e_commerce_app/ui/success.dart';
import 'package:e_commerce_app/widget/app_color.dart';
import 'package:e_commerce_app/widget/text_screen.dart';
import 'package:e_commerce_app/widget/icon_button_screen.dart';

class AddShippingAddress extends StatefulWidget {
  const AddShippingAddress({super.key});

  @override
  State<AddShippingAddress> createState() => _AddShippingAddressState();
}

class _AddShippingAddressState extends State<AddShippingAddress> {
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
          child: TextHeadLineBar(textHeadLine: 'Adding Shipping Address'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            _textFieldAdress('Full name'),
            _textFieldAdress('Address'),
            _textFieldAdress('City'),
            _textFieldAdress('State/Provice/Region'),
            _textFieldAdress('Zip code(Postal Code)'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _textFieldAdress('Country'),
                const Icon(
                  Icons.keyboard_arrow_right,
                  size: 18,
                  color: AppColor.blackColor,
                ),
              ],
            ),
            ButtonOnclick(
              textButton: 'SAVE ADDRESS',
              functionButtonClick: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Success()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFieldAdress(String text) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      child: TextField(
        decoration: InputDecoration(border: InputBorder.none, labelText: text),
      ),
    );
  }
}
