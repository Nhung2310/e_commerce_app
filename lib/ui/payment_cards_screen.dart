import 'package:flutter/material.dart';
import 'package:e_commerce_app/widget/app_color.dart';
import 'package:e_commerce_app/widget/app_assets.dart';
import 'package:e_commerce_app/widget/text_screen.dart';
import 'package:e_commerce_app/widget/my_custom_paint.dart';
import 'package:e_commerce_app/widget/icon_button_screen.dart';
import 'package:e_commerce_app/widget/add_new_card_bottom_sheet.dart';

class PaymentCardsScreen extends StatefulWidget {
  const PaymentCardsScreen({super.key});

  @override
  State<PaymentCardsScreen> createState() => _PaymentCardsScreenState();
}

class _PaymentCardsScreenState extends State<PaymentCardsScreen> {
  bool _isCheckedCard = false;
  bool _isCheckedVisa = false;

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
        title: Center(child: TextHeadLineBar(textHeadLine: 'Payment methods')),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          print('Đã nhấn nút FloatingActionButton');
          showModelBottomSheetAddNewCard(context);
        },
        backgroundColor: AppColor.blackColor,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: AppColor.whiteColor),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextHead(textHead: 'Your payment cards'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 216,
              width: 343,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.blackColor,
              ),
              child: Stack(
                children: [
                  CustomPaint(size: Size.infinite, painter: MyCustomPaint()),

                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Image(
                            image: AssetImage(AppAssets.imageChip),
                            width: 32,
                            height: 24,
                            fit: BoxFit.cover,
                          ),
                        ),

                        Text(
                          '**** **** **** 3947',
                          style: TextStyle(
                            fontSize: 22,
                            color: AppColor.whiteColor,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Card Holder Name',
                                  style: TextStyle(
                                    color: AppColor.whiteColor,
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  'Jennyfer Doe',
                                  style: TextStyle(
                                    color: AppColor.whiteColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Expiry Date',
                                  style: TextStyle(
                                    color: AppColor.whiteColor,
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  '05/23',
                                  style: TextStyle(
                                    color: AppColor.whiteColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Image(image: AssetImage(AppAssets.imageGroup)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: _isCheckedCard,
                onChanged: (bool? value) {
                  setState(() {
                    _isCheckedCard = value!;
                    if (value) {
                      _isCheckedVisa = false;
                    }
                  });
                },
                checkColor: AppColor.whiteColor,
                fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(WidgetState.selected)) {
                    return AppColor.blackColor;
                  }
                  return AppColor.whiteColor;
                }),
                side: const BorderSide(color: AppColor.grayColor),
              ),
              const Text('Use as default payment method'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 216,
              width: 343,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.grayColor,
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'VISA',
                          style: TextStyle(
                            color: AppColor.whiteColor,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      '**** **** **** 3947',
                      style: TextStyle(
                        fontSize: 22,
                        color: AppColor.whiteColor,
                      ),
                    ),
                    Image(
                      image: AssetImage(AppAssets.imageChip),
                      width: 32,
                      height: 24,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Card Holder Name',
                                style: TextStyle(
                                  color: AppColor.whiteColor,
                                  fontSize: 10,
                                ),
                              ),
                              Text(
                                'Jennyfer Doe',
                                style: TextStyle(
                                  color: AppColor.whiteColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Expiry Date',
                                style: TextStyle(
                                  color: AppColor.whiteColor,
                                  fontSize: 10,
                                ),
                              ),
                              Text(
                                '05/23',
                                style: TextStyle(
                                  color: AppColor.whiteColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: _isCheckedVisa,
                onChanged: (bool? value) {
                  setState(() {
                    _isCheckedVisa = value!;
                    if (value) {
                      _isCheckedCard = false;
                    }
                  });
                },
                checkColor: AppColor.whiteColor,
                fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(WidgetState.selected)) {
                    return AppColor.blackColor;
                  }
                  return AppColor.whiteColor;
                }),
                side: const BorderSide(color: AppColor.grayColor),
              ),
              const Text('Use as default payment method'),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }

  void showModelBottomSheetAddNewCard(BuildContext context) {
    try {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return const AddNewCardBottomSheet();
        },
      );
    } catch (e) {
      print('Lỗi khi hiển thị bottom sheet: $e');
    }
  }
  // void showModelBottomSheetAddNewCard(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext context) {
  //       // return const AddNewCardBottomSheet();

  //       return StatefulBuilder(
  //         builder: (BuildContext context, StateSetter setStateInBottomSheet) {
  //           return const AddNewCardBottomSheet();
  //           //     return FractionallySizedBox(
  //           //       heightFactor: 0.85,
  //           //       child: Container(
  //           //         width: double.infinity,
  //           //         child: Column(
  //           //           children: [
  //           //             const const const const const Padding(
  //           //               padding: const EdgeInsets.all(8.0),
  //           //               child: TextHead(textHead: 'Add new card'),
  //           //             ),
  //           //             TextFormField(
  //           //               decoration: const InputDecoration(
  //           //                 hintText: 'Name on card',
  //           //                 hintStyle: TextStyle(
  //           //                   color: AppColor.grayColor,
  //           //                   fontSize: 14,
  //           //                 ),
  //           //                 border: InputBorder.none,
  //           //               ),
  //           //             ),
  //           //             Row(
  //           //               children: [
  //           //                 TextFormField(
  //           //                   decoration: const InputDecoration(
  //           //                     labelText: 'Card number',
  //           //                     labelStyle: TextStyle(
  //           //                       color: AppColor.grayColor,
  //           //                       fontSize: 14,
  //           //                     ),
  //           //                     border: InputBorder.none,

  //           //                   ),
  //           //                   keyboardType: TextInputType.number,
  //           //                   maxLength: 19,
  //           //                 ),

  //           //                 const Image(image: const AssetImage(AppAssets.imageGroup)),
  //           //               ],
  //           //             ),
  //           //             TextFormField(
  //           //               inputFormatters: [

  //           //               ],
  //           //               decoration: InputDecoration(
  //           //                 labelText: 'Expire Date',
  //           //                 labelStyle: TextStyle(color: AppColor.grayColor, fontSize: 14),
  //           //                 border: InputBorder.none,
  //           //               ),
  //           //               keyboardType: TextInputType.datetime,
  //           //             )
  //           //           ],
  //           //         ),
  //           //       ),
  //           //     );
  //         },
  //       );
  //     },
  //   );
  // }
}
