import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/enum/card_type.dart';
import 'package:e_commerce_app/widget/app_color.dart';
import 'package:e_commerce_app/widget/app_assets.dart';

class CardUtils {
  static final Map<CardType, RegExp> cardNumPatterns = <CardType, RegExp>{
    CardType.Visa: RegExp(r'4[0-9]{0,15}$'),
    CardType.MasterCard: RegExp(r'^5[1-5][0-9]{0,14}$'),
  };

  static Widget? getCardIcon(CardType? cardType) {
    String img = '';
    Icon? icon;
    switch (cardType) {
      case CardType.Visa:
        img = AppAssets.imageGroup;
        break;
      case CardType.MasterCard:
        img = AppAssets.imageGroup;
        break;
      case CardType.Invalid:
        icon = const Icon(Icons.warning, size: 24, color: AppColor.redColor);
        break;
      default:
        icon = const Icon(
          Icons.credit_card,
          size: 24,
          color: AppColor.grayColor,
        );
    }
  }

  static String getCleanedNumber(String text) {
    RegExp regExp = RegExp(r'[^\d]');
    return text.replaceAll(regExp, '');
  }

  static CardType getCardTyperFrmNumber(String input) {
    CardType cardType;
    if (input.isEmpty) {
      return CardType.Invalid;
    }
    for (var entry in cardNumPatterns.entries) {
      if (input.startsWith(entry.value)) {
        return entry.key;
      }
    }
    return CardType.Invalid;
  }

  // Đây là thuật toán phổ biến để kiểm tra tính hợp lệ của số thẻ (không phải là xác thực thẻ có tồn tại hay không)
  static String? validateCardNumWithLuhnAlgorithm(String? input) {
    if (input == null || input.isEmpty) {
      return 'Vui lòng nhập số thẻ.';
    }
    input = getCleanedNumber(input);
    if (input.length < 8) {
      return 'Số thẻ không hợp lệ.';
    }

    int sum = 0;
    int length = input.length;
    for (int i = 0; i < length; i++) {
      int digit = int.parse(input[length - 1 - i]);
      if (i % 2 == 1) {
        digit *= 2;
      }
      sum += digit > 9 ? (digit - 9) : digit;
    }

    if (sum % 10 == 0) {
      return null;
    }
    return 'Số thẻ không hợp lệ.';
  }

  static List<int> getExpiryDate(String value) {
    List<String> split = value.split(RegExp(r'(/)'));
    int month = int.parse(split[0]);
    int year = int.parse(split[1]);
    return [month, year];
  }

  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập ngày hết hạn.';
    }
    List<int> expiryDate = getExpiryDate(value);
    int month = expiryDate[0];
    int year = expiryDate[1];
    if (month < 1 || month > 12) {
      return 'Tháng không hợp lệ.';
    }

    int yearNow = DateTime.now().year;
    int century = (yearNow ~/ 100) * 100;
    int fullYear = century + year;

    if (fullYear < yearNow && (yearNow - fullYear) > 50) {
      fullYear += 100;
    }

    if (fullYear < yearNow) {
      return 'Thẻ đã hết hạn.';
    }
    if (fullYear == yearNow) {
      int monthNow = DateTime.now().month;
      if (month < monthNow) {
        return 'Thẻ đã hết hạn.';
      }
    }
    return null;
  }

  static String? validateCVV(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập CVV.';
    }
    if (value.length < 3 || value.length > 4) {
      return "CVV không hợp lệ.";
    }
    return null;
  }
}
