import 'dart:math';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/widget/app_color.dart';
import 'package:e_commerce_app/widget/app_assets.dart';
import 'package:e_commerce_app/widget/text_screen.dart';
import 'package:e_commerce_app/widget/text_field_screen.dart';
import 'package:e_commerce_app/ui/forgot_password_screen.dart';
import 'package:e_commerce_app/widget/icon_button_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            title: TextHeadLine(text: 'Login'),
          ),

          SliverToBoxAdapter(
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                child: Column(
                  children: [
                    TextFieldAuth(labelText: 'Email'),
                    const SizedBox(height: 16),
                    TextFieldPassword(
                      hintText: 'Password',
                      labelText: 'Password',
                    ),
                    const SizedBox(height: 24),
                    TextSocial(
                      textSocial: 'Forgot your password?',
                      onTapIcon: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    ButtonOnclick(
                      textButton: 'LOGIN',
                      functionButtonClick: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordScreen(),
                          ),
                        );
                        print('Bắt đầu gọi FunctionTrueFalse...');
                        bool result = await FunctionTrueFalse();
                        print('Kết quả sau 5 giây: $result');
                      },
                    ),
                    const SizedBox(height: 80),
                    TextInactive(textInactive: 'Or login with social account'),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ignore: avoid_print
                        IconButtonMedia(
                          image: AppAssets.icGoogle,
                          printObject: () {
                            print('google');
                          },
                        ),
                        const SizedBox(width: 20),
                        IconButtonMedia(
                          image: AppAssets.icFacebook,
                          printObject: () => print('facebook'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<bool> FunctionTrueFalse() async {
  return await Future.delayed(const Duration(seconds: 5), () {
    Random random = Random();
    int randomNumber = random.nextInt(100);
    if (randomNumber % 2 == 0) {
      return true;
    } else {
      return false;
    }
  });
}
