import 'package:flutter/material.dart';
import 'package:e_commerce_app/widget/app_color.dart';

// ignore: must_be_immutable
class TextFieldAuth extends StatelessWidget {
  TextFieldAuth({required this.labelText, super.key});
  String labelText;
  //String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
        child: TextField(
          style: const TextStyle(color: Colors.black, fontSize: 13),
          decoration: InputDecoration(
            labelText: labelText,
            //  hintText: hintText,
            border: InputBorder.none,
            labelStyle: const TextStyle(color: Colors.grey, fontSize: 13),
          ),
          keyboardType: TextInputType.visiblePassword,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TextFieldPassword extends StatelessWidget {
  TextFieldPassword({
    required this.hintText,
    required this.labelText,
    super.key,
  });
  String labelText;
  String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
        child: TextField(
          style: const TextStyle(color: Colors.black, fontSize: 13),
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            border: InputBorder.none,
            labelStyle: const TextStyle(color: Colors.grey, fontSize: 13),
          ),
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          obscuringCharacter: '*',
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TextFieldEmail extends StatelessWidget {
  TextEditingController controller;
  final String? errorText;
  final VoidCallback? onClear;
  final ValueChanged<String>? onChanged;
  final bool hasError;

  TextFieldEmail({
    required this.controller,
    super.key,
    this.errorText,
    this.onClear,
    this.onChanged,
    this.hasError = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),

            border: Border.all(
              color: hasError
                  ? AppColor.redColor
                  : AppColor.whiteBackgroundColor,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: TextFormField(
              controller: controller,
              style: const TextStyle(color: AppColor.blackColor, fontSize: 13),
              decoration: InputDecoration(
                // errorText: errorText,
                labelText: 'Email',
                border: InputBorder.none,
                labelStyle: TextStyle(
                  color: hasError ? AppColor.redColor : Colors.grey,
                  fontSize: 13,
                ),
                suffixIcon: IconButton(
                  onPressed: onClear,
                  icon: const Icon(Icons.clear),
                  color: hasError ? AppColor.redColor : Colors.grey,
                ),
              ),

              validator: (value) => null,
              onChanged: onChanged,

              // onSaved: (newValue) {
              // _input = newValue!;
              // },
              // validator: (value) {
              // if (value == null || value.isEmpty) {
              //   checkFormError = true;
              //   return 'Please, enter your email address.';
              // } else if (!RegExp(
              //   r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              // ).hasMatch(value)) {
              //   checkFormError = true;
              //   return 'Not a valid email address. Should be your@email.com';
              // }
              // checkFormError = false;
              //  return null;
              // },
              keyboardType: TextInputType.emailAddress,
            ),
          ),
        ),
        if (hasError && errorText != null && errorText!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 4.0),
            child: Text(
              errorText!,
              style: const TextStyle(color: AppColor.redColor, fontSize: 12.0),
            ),
          ),
      ],
    );
  }
}
