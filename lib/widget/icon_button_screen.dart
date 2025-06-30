import 'package:flutter/material.dart';
import 'package:e_commerce_app/widget/app_color.dart';

// ignore: must_be_immutable
class IconButtonMedia extends StatelessWidget {
  IconButtonMedia({super.key, required this.image, required this.printObject});

  String image;
  Function printObject;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 92,
      height: 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),

        color: Colors.white,
      ),
      child: IconButton(
        color: Colors.white,
        onPressed: () {
          printObject();
        },
        icon: Image.asset(image),
      ),
    );
  }
}

// ignore: must_be_immutable
class ButtonOnclick extends StatelessWidget {
  String textButton;
  ButtonOnclick({
    required this.textButton,
    required this.functionButtonClick,
    super.key,
  });
  Function functionButtonClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: AppColor.redColorBox,
            blurRadius: 8,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.redColorBox,
          fixedSize: const Size(343, 48),
          shadowColor: AppColor.redColorBox.withAlpha(64),
        ),
        onPressed: () {
          functionButtonClick();
        },
        child: Text(
          textButton,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColor.whiteColor,
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class IconButtonBack extends StatelessWidget {
  Function iconButtonBack;
  IconButtonBack({required this.iconButtonBack, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        iconButtonBack();
      },
      icon: const Icon(
        Icons.arrow_back_ios,
        color: AppColor.blackColor,
        size: 20,
      ),
    );
  }
}

// ignore: must_be_immutable
class ButtonCatalog extends StatelessWidget {
  String text;
  ButtonCatalog({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: AppColor.blackColor),
          child: Text(
            text,
            style: const TextStyle(fontSize: 14, color: AppColor.whiteColor),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class FiltersButton extends StatelessWidget {
  FiltersButton({
    required this.iconButton,
    required this.text,
    required this.functionButtonClick,
    super.key,
  });
  Function functionButtonClick;
  Icon iconButton;
  String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            functionButtonClick();
          },
          icon: iconButton,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),

        TextButton(
          onPressed: () {
            functionButtonClick();
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 11,
              color: AppColor.blackColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
