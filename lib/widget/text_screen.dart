import 'package:flutter/material.dart';
import 'package:e_commerce_app/widget/app_color.dart';

// ignore: must_be_immutable
class TextHeadLine extends StatelessWidget {
  String text;
  TextHeadLine({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        color: AppColor.blackColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

// ignore: must_be_immutable
class TextSocial extends StatelessWidget {
  String textSocial;
  TextSocial({super.key, required this.textSocial, required this.onTapIcon});
  Function onTapIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapIcon();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            textSocial,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),

          const Icon(Icons.arrow_right_alt_outlined, color: AppColor.redColor),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class TextInactive extends StatelessWidget {
  String textInactive;
  TextInactive({required this.textInactive, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      textInactive,
      style: const TextStyle(
        fontSize: 14,
        color: AppColor.blackColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

// ignore: must_be_immutable
class TextHeadLineBar extends StatelessWidget {
  String textHeadLine;
  TextHeadLineBar({required this.textHeadLine, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      textHeadLine,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 0.22,
      ),
      textAlign: TextAlign.center,
    );
  }
}

// ignore: must_be_immutable
class TextMainPage extends StatelessWidget {
  TextMainPage({required this.textMainPage, super.key});
  String textMainPage;

  @override
  Widget build(BuildContext context) {
    return Text(
      textMainPage,
      style: const TextStyle(
        fontSize: 24,
        color: AppColor.whiteColor,
        fontWeight: FontWeight.w900,
        height: 1.2,
      ),
    );
  }
}

// ignore: must_be_immutable
class WhiteText extends StatelessWidget {
  const WhiteText({required this.text, super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColor.whiteColor,
      ),
    );
  }
}

// ignore: must_be_immutable
class TextTitle extends StatelessWidget {
  TextTitle({required this.text, required this.color, super.key});
  String text;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 24, color: color, fontWeight: FontWeight.w700),
    );
  }
}

// ignore: must_be_immutable
class Subtitle extends StatelessWidget {
  Subtitle({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        color: Colors.grey,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

// ignore: must_be_immutable
class TextBrandName extends StatelessWidget {
  TextBrandName({required this.text, super.key});
  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 11, color: AppColor.grayColor),
    );
  }
}

// ignore: must_be_immutable
class TextItemProduct extends StatelessWidget {
  TextItemProduct({required this.text, super.key});
  String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        color: AppColor.blackColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

// ignore: must_be_immutable
class TextPrice extends StatelessWidget {
  const TextPrice({super.key, required this.oldPrice, required this.newPrice});

  final String newPrice;
  final String oldPrice;

  @override
  Widget build(BuildContext context) {
    if (oldPrice == null || oldPrice!.isEmpty) {
      return Text(
        '$newPrice',
        style: const TextStyle(
          color: AppColor.blackColor,
          fontWeight: FontWeight.w600,
        ),
      );
    } else {
      return Text.rich(
        TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: '$oldPrice',
              style: const TextStyle(
                color: AppColor.grayColor,
                decoration: TextDecoration.lineThrough,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: ' $newPrice',
              style: const TextStyle(
                color: AppColor.redColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    }
  }
}

class TextListCategories extends StatelessWidget {
  String text;
  TextListCategories({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32.0, 8.0, 8.0, 8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: AppColor.blackColor,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TextCategoriesCard extends StatelessWidget {
  String text;
  TextCategoriesCard({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, color: AppColor.blackColor),
      ),
    );
  }
}

class TextSortBy extends StatelessWidget {
  TextSortBy({required this.text, required this.backgroundColor, super.key});
  String text;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: AppColor.blackColor,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TextDescription extends StatelessWidget {
  TextDescription({required this.textDescription, super.key});
  String textDescription;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        textDescription,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.15,
        ),
      ),
    );
  }
}

class TextNameUser extends StatelessWidget {
  TextNameUser({required this.textNameUser, super.key});
  String textNameUser;
  @override
  Widget build(BuildContext context) {
    return Text(
      textNameUser,
      style: const TextStyle(
        fontSize: 14,
        color: AppColor.blackColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class TextDate extends StatelessWidget {
  String textDate;
  TextDate({required this.textDate, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      textDate,
      style: const TextStyle(fontSize: 11, color: AppColor.grayColor),
    );
  }
}

class TextReview extends StatelessWidget {
  String textReview;
  TextReview({required this.textReview, super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          textReview,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.15,
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class RichTextProduct extends StatelessWidget {
  String textItem;
  String textDetailItem;
  RichTextProduct({
    required this.textItem,
    required this.textDetailItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: textItem,
            style: const TextStyle(fontSize: 11, color: AppColor.grayColor),
          ),
          TextSpan(
            text: textDetailItem,
            style: const TextStyle(fontSize: 11, color: AppColor.blackColor),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class TextDiscount extends StatelessWidget {
  String text;
  double sizeText;
  TextDiscount({required this.text, required this.sizeText, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColor.whiteColor,
        fontSize: sizeText,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

// ignore: must_be_immutable
class TextHead extends StatelessWidget {
  String textHead;
  TextHead({required this.textHead, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      textHead,
      style: const TextStyle(
        color: AppColor.blackColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

// ignore: must_be_immutable
class TextCard extends StatelessWidget {
  String text;
  double size;
  FontWeight fontWeight;
  TextCard({
    required this.text,
    required this.size,
    required this.fontWeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColor.whiteColor,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}

class RichTextInformationOrder extends StatelessWidget {
  final String textItem;
  final String textDetailItem;

  const RichTextInformationOrder({
    Key? key,
    required this.textItem,
    required this.textDetailItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              textItem,
              style: const TextStyle(fontSize: 14, color: AppColor.grayColor),
            ),
          ),
          const SizedBox(width: 8),

          Expanded(
            child: Text(
              textDetailItem,
              style: const TextStyle(
                fontSize: 14,
                color: AppColor.blackColor,
                fontWeight: FontWeight.bold,
              ),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
