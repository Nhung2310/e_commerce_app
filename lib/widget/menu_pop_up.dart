import 'package:flutter/material.dart';
import 'package:e_commerce_app/widget/app_color.dart';

class MenuPopUp extends StatelessWidget {
  const MenuPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Add to favorites ',
            style: TextStyle(color: AppColor.blackColor, fontSize: 14),
          ),
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Delete from the list ',
            style: TextStyle(color: AppColor.blackColor, fontSize: 14),
          ),
        ),
      ],
    );
  }
}
