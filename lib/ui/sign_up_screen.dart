import 'dart:math';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/ui/login_screen.dart';
import 'package:e_commerce_app/widget/app_color.dart';
import 'package:e_commerce_app/widget/app_assets.dart';
import 'package:e_commerce_app/widget/text_screen.dart';
import 'package:e_commerce_app/widget/text_field_screen.dart';
import 'package:e_commerce_app/widget/icon_button_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteBackgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar.medium(
            backgroundColor: AppColor.whiteBackgroundColor,
            leading: IconButtonBack(iconButtonBack: () {}),
            title: TextHeadLine(text: 'Sign up'),
          ),

          SliverToBoxAdapter(
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                child: Column(
                  children: [
                    TextFieldAuth(labelText: 'Name'),
                    const SizedBox(height: 16),
                    TextFieldAuth(labelText: 'Email'),
                    const SizedBox(height: 16),
                    TextFieldPassword(
                      hintText: 'Password',
                      labelText: 'Password',
                    ),
                    const SizedBox(height: 24),
                    TextSocial(
                      textSocial: 'Already have an account?',
                      onTapIcon: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    ButtonOnclick(
                      textButton: 'SIGN UP',
                      functionButtonClick: () async {
                        bool success = await singInWithGmail(context);

                        showDialog(
                          // ignore: use_build_context_synchronously
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text(success ? 'Thành công' : 'Thất bại'),
                            content: Text(
                              success ? 'Bạn đã đăng nhập.' : 'Đăng nhập lỗi.',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(ctx).pop(),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 80),
                    TextInactive(
                      textInactive: 'Or sign up with social account',
                    ),
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

  Future<bool> singInWithGmail(BuildContext context) async {
    var intValue = Random().nextInt(100);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pop();
    if (intValue % 2 == 0) {
      return true;
    } else {
      return false;
    }
  }
}
