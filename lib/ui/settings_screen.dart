import 'package:flutter/material.dart';
import 'package:e_commerce_app/widget/app_color.dart';
import 'package:e_commerce_app/widget/app_assets.dart';
import 'package:e_commerce_app/widget/text_screen.dart';
import 'package:e_commerce_app/widget/text_field_screen.dart';
import 'package:e_commerce_app/widget/icon_button_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _textFieldDateOfBirthController =
      TextEditingController();
  final TextEditingController _textFieldFullNameController =
      TextEditingController();
  final TextEditingController _textFieldPasswordController =
      TextEditingController();

  bool light = true;

  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _repeatNewPasswordController =
      TextEditingController();
  String? _oldPasswordError;
  String? _newPasswordError;
  String? _repeatNewPasswordError;

  @override
  void dispose() {
    _textFieldDateOfBirthController.dispose();
    _textFieldFullNameController.dispose();
    _textFieldPasswordController.dispose();
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _repeatNewPasswordController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      helpText: 'Select Date of Birth',
      cancelText: 'Cancel',
      confirmText: 'Confirm',
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColor.redColor,
            colorScheme: const ColorScheme.light(primary: AppColor.redColor),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _textFieldDateOfBirthController.text =
            "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButtonBack(
          iconButtonBack: () {
            Navigator.pop(context);
          },
        ),
        actions: const [Icon(Icons.search)],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: TextHeadLine(text: 'Settings'),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextHead(textHead: 'Personal Information'),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  child: TextField(
                    controller: _textFieldFullNameController,
                    //obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Full name',
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _textFieldDateOfBirthController,
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  decoration: const InputDecoration(
                    labelText: 'Date of Birth',
                    border: InputBorder.none,
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextHead(textHead: 'Password'),
                  ),
                  InkWell(
                    onTap: () {
                      showModelBottomSheetChangePassword(context);
                    },
                    child: const Text(
                      'Change',
                      style: TextStyle(color: AppColor.grayColor, fontSize: 14),
                    ),
                  ),
                ],
              ),
              TextFieldPassword(
                hintText: '**************',
                labelText: 'Password',
              ),
              TextHead(textHead: 'Notifications'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text(
                      'Sales',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColor.blackColor,
                      ),
                    ),
                    Switch(
                      value: light,
                      activeColor: AppColor.green,
                      onChanged: (bool value) {
                        setState(() {
                          light = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'New arrivals',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Delivery status changes',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showModelBottomSheetChangePassword(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setStateInBottomSheet) {
            void _resetErrors() {
              setStateInBottomSheet(() {
                _oldPasswordError = null;
                _newPasswordError = null;
                _repeatNewPasswordError = null;
              });
            }

            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),

              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextHead(textHead: 'Password Change'),
                      ),
                      TextFormField(
                        controller: _oldPasswordController,
                        onChanged: (_) => _resetErrors(),

                        decoration: const InputDecoration(
                          hintText: 'Old Password',
                          hintStyle: TextStyle(
                            color: AppColor.grayColor,
                            fontSize: 14,
                          ),

                          border: InputBorder.none,
                        ),
                      ),
                      const SizedBox(height: 8),

                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 0.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Chuyển đến màn hình Forgot Password',
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: AppColor.grayColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _newPasswordController,
                        onChanged: (_) => _resetErrors(),

                        decoration: const InputDecoration(
                          hintText: 'New Password',
                          hintStyle: TextStyle(
                            color: AppColor.grayColor,
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        controller: _repeatNewPasswordController,
                        onChanged: (_) => _resetErrors(),

                        decoration: const InputDecoration(
                          hintText: 'Repeat New Password',
                          hintStyle: TextStyle(
                            color: AppColor.grayColor,
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                      const SizedBox(height: 32),
                      ButtonOnclick(
                        textButton: 'SAVE PASSWORD',
                        functionButtonClick: () {
                          _resetErrors();

                          String oldPassword = _oldPasswordController.text;
                          String newPassword = _newPasswordController.text;
                          String repeatNewPassword =
                              _repeatNewPasswordController.text;

                          bool hasError = false;

                          if (oldPassword.isEmpty) {
                            setStateInBottomSheet(() {
                              _oldPasswordError = 'Vui lòng nhập mật khẩu cũ.';
                            });
                            hasError = true;
                          }

                          if (newPassword.isEmpty) {
                            setStateInBottomSheet(() {
                              _newPasswordError = 'Vui lòng nhập mật khẩu mới.';
                            });
                            hasError = true;
                          } else if (newPassword.length < 6) {
                            setStateInBottomSheet(() {
                              _newPasswordError =
                                  'Mật khẩu mới phải có ít nhất 6 ký tự.';
                            });
                            hasError = true;
                          }

                          if (repeatNewPassword.isEmpty) {
                            setStateInBottomSheet(() {
                              _repeatNewPasswordError =
                                  'Vui lòng nhập lại mật khẩu mới.';
                            });
                            hasError = true;
                          } else if (newPassword != repeatNewPassword) {
                            setStateInBottomSheet(() {
                              _repeatNewPasswordError =
                                  'Mật khẩu mới và mật khẩu lặp lại không khớp.';
                            });
                            hasError = true;
                          }

                          if (!hasError) {
                            print('Old Password: $oldPassword');
                            print('New Password: $newPassword');
                            print('Mật khẩu đã được thay đổi thành công!');

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Mật khẩu đã được thay đổi thành công!',
                                ),
                              ),
                            );
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
