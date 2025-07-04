import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:e_commerce_app/enum/card_type.dart';
import 'package:e_commerce_app/utils/card_utils.dart';
import 'package:e_commerce_app/widget/app_color.dart';
import 'package:e_commerce_app/model/payment_card.dart';
import 'package:e_commerce_app/widget/text_screen.dart';
import 'package:e_commerce_app/widget/icon_button_screen.dart';
import 'package:e_commerce_app/utils/card_number_input_formatter.dart';

class AddNewCardBottomSheet extends StatefulWidget {
  const AddNewCardBottomSheet({super.key});

  @override
  State<AddNewCardBottomSheet> createState() => _AddNewCardBottomSheetState();
}

class _AddNewCardBottomSheetState extends State<AddNewCardBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  PaymentCard _paymentCard = PaymentCard();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  CardType _cardType = CardType.Invalid;
  bool _isCheckNewCard = false;

  @override
  void initState() {
    super.initState();
    _cardNumberController.addListener(_getCardTypeFrmNumber);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _cardNumberController.removeListener(_getCardTypeFrmNumber);
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  void _getCardTypeFrmNumber() {
    String input = CardUtils.getCleanedNumber(_cardNumberController.text);
    CardType cardType = CardUtils.getCardTyperFrmNumber(input);
    if (cardType != _cardType) {
      setState(() {
        _cardType = cardType;
      });
    }
  }

  void _addCard() {
    final form = _formKey.currentState;
    if (form == null) return;

    if (form.validate()) {
      form.save();
      print('Thẻ hợp lệ và đã lưu: $_paymentCard');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng kiểm tra lại thông tin thẻ.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.85,
      child: Container(
        width: MediaQuery.of(
          context,
        ).size.width, // Ràng buộc chiều rộng rõ ràng
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: TextHead(textHead: 'Add new card')),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 32,
                        child: TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            hintText: 'Name on card',
                            hintStyle: TextStyle(
                              color: AppColor.grayColor,
                              fontSize: 14,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                          ),

                          onSaved: (value) => _paymentCard.name = value,
                          validator: (value) => value!.isEmpty
                              ? 'Vui lòng nhập tên chủ thẻ.'
                              : null,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Container(
                        width: MediaQuery.of(context).size.width - 32,
                        child: TextFormField(
                          controller: _cardNumberController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(19),
                            CardNumberInputFormatter(),
                          ],
                          decoration: InputDecoration(
                            labelText: 'Card number',
                            labelStyle: const TextStyle(
                              color: AppColor.grayColor,
                              fontSize: 14,
                            ),
                            border: InputBorder.none,
                            suffixIcon: CardUtils.getCardIcon(_cardType),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                          ),
                          onSaved: (value) => _paymentCard.number =
                              CardUtils.getCleanedNumber(value!),
                          validator: CardUtils.validateCardNumWithLuhnAlgorithm,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Container(
                        width: MediaQuery.of(context).size.width - 32,
                        child: TextFormField(
                          controller: _expiryDateController,
                          keyboardType: TextInputType.datetime,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                            // CardMonthInputFormatter(),
                          ],
                          decoration: const InputDecoration(
                            labelText: 'Expire Date',
                            labelStyle: TextStyle(
                              color: AppColor.grayColor,
                              fontSize: 14,
                            ),
                            hintText: 'MM/YY',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                          ),
                          onSaved: (value) {
                            if (value != null && value.isNotEmpty) {
                              List<int> expiryDate = CardUtils.getExpiryDate(
                                value,
                              );
                              _paymentCard.month = expiryDate[0];
                              _paymentCard.year = expiryDate[1];
                            }
                          },
                          validator: CardUtils.validateDate,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Container(
                        width: MediaQuery.of(context).size.width - 32,
                        child: TextFormField(
                          controller: _cvvController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                          ],
                          decoration: const InputDecoration(
                            labelText: 'CVV',
                            labelStyle: TextStyle(
                              color: AppColor.grayColor,
                              fontSize: 14,
                            ),
                            hintText: 'XXX',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                          ),
                          onSaved: (value) =>
                              _paymentCard.cvv = int.tryParse(value ?? ''),
                          validator: CardUtils.validateCVV,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        children: [
                          Checkbox(
                            value: _isCheckNewCard,
                            onChanged: (bool? value) {
                              setState(() {
                                _isCheckNewCard = value!;
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
                          const Text('Set as default payment method'),
                        ],
                      ),
                      const SizedBox(height: 24.0),
                      ButtonOnclick(
                        textButton: 'ADD CARD',
                        functionButtonClick: _addCard,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).viewInsets.bottom,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
