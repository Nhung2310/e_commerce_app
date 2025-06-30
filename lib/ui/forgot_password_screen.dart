import 'package:flutter/material.dart';
import 'package:e_commerce_app/widget/app_color.dart';
import 'package:e_commerce_app/widget/text_screen.dart';
import 'package:e_commerce_app/widget/text_field_screen.dart';
import 'package:e_commerce_app/widget/icon_button_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  //final GlobalKey<FormState> emailformKey = GlobalKey<FormState>();
  //final ValueNotifier<bool> emailHasErrorNotifier = ValueNotifier<bool>(false);
  final TextEditingController _emailController = TextEditingController();
  String? emailError;
  @override
  void initState() {
    _emailController.addListener(_onEmailFieldChanged);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();

    super.dispose();
  }

  void _onEmailFieldChanged() {
    if (emailError != null) {
      setState(() {
        emailError = null;
      });
    }
  }

  void _validateEmail() {
    String? currentError;
    final String email = _emailController.text.trim();
    if (email.isEmpty) {
      currentError = 'Please, enter your email address.';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      currentError = 'Not a valid email address. Should be your@email.com';
    } else {
      currentError = null;
    }

    setState(() {
      emailError = currentError;
    });

    if (currentError == null) {
      print('Email hợp lệ! Tiến hành gửi link khôi phục mật khẩu.');
    } else {
      print('Email không hợp lệ. Vui lòng kiểm tra lại.');
    }
  }

  void _onClearEmailField() {
    _emailController.clear();
    setState(() {
      emailError = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteBackgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar.medium(
            backgroundColor: AppColor.whiteBackgroundColor,
            leading: IconButtonBack(
              iconButtonBack: () {
                Navigator.pop(context);
              },
            ),
            title: TextHeadLine(text: 'Forgot password'),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
              child: Column(
                children: [
                  Wrap(
                    children: [
                      TextInactive(
                        textInactive:
                            'Please, enter your email address. You will receive a link to create a new password via email.',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextFieldEmail(
                    controller: _emailController,
                    errorText: emailError,
                    onClear: _onClearEmailField,
                    onChanged: (value) => _onEmailFieldChanged(),
                    hasError: emailError != null,
                  ),
                  const SizedBox(height: 64),

                  ButtonOnclick(
                    textButton: 'SEND',
                    functionButtonClick: () {
                      // if (emailformKey.currentState!.validate()) {
                      //   emailformKey.currentState!.save();
                      //   print(
                      //     'Email hợp lệ! Tiến hành gửi link khôi phục mật khẩu.',
                      //   );
                      // } else {
                      //   print('Email không hợp lệ. Vui lòng kiểm tra lại.');
                      // }

                      _validateEmail();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
