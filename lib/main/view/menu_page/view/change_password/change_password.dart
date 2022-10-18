import 'package:chat_app_b/auth/auth.dart';
import 'package:chat_app_b/constants/fonts.dart';
import 'package:chat_app_b/data/repository/app_repository.dart';
import 'package:chat_app_b/wigdets/buttons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../auth/bloc/auth_bloc.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../data/sharedprefs/constants.dart';
import '../../../../../data/sharedprefs/shared_preference_helper.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _typeAgainNewPasswordController =
      TextEditingController();
  final userDocumentRef = FirebaseFirestore.instance.collection('users');

  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AppRepository appRepository = AppRepository();
  String? passwordUser;
  bool hideCurrentPassword = true;
  bool hideNewPassword = true;
  bool hideNewAgainPassword = true;

  void showCurrentPassword() {
    setState(() {
      hideCurrentPassword = !hideCurrentPassword;
    });
  }

  void showNewPassword() {
    setState(() {
      hideNewPassword = !hideNewPassword;
    });
  }

  void showNewAgainPassword() {
    setState(() {
      hideNewAgainPassword = !hideNewAgainPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(SizesApp.s16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: SizesApp.s42,
                  ),
                  Container(
                    width: SizesApp.s40,
                    height: SizesApp.s40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(SizesApp.s20),
                      color:
                          ColorsApp.colorBorderButtonAndText.withOpacity(0.1),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        minimumSize: const Size(0, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(SizesApp.s20),
                        ),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: ColorsApp.colorBorderButtonAndText,
                        size: SizesApp.s32,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: SizesApp.s24,
                  ),
                  Text(
                    'Đổi mật khẩu',
                    style: FontsApp().fontBodyLarge,
                  ),
                  const SizedBox(
                    height: SizesApp.s24,
                  ),
                  _buildTextFieldWithTitle(
                    title: 'Mật khẩu hiện tại',
                    hintText: 'Nhập mật khẩu hiện tại',
                    controller: _currentPasswordController,
                    validator: (value) {
                      AuthRepository().getPassword().then((password) {
                        passwordUser = password;
                      });

                      if (value!.length < 6) {
                        return 'Mật khẩu phải từ 6 kí tự';
                      }
                      if (value != passwordUser) {
                        return 'Mật khẩu không chính xác';
                      }

                      return null;
                    },
                    onPressedIcon: showCurrentPassword,
                    hidePassword: hideCurrentPassword,
                  ),
                  const SizedBox(
                    height: SizesApp.s16,
                  ),
                  _buildTextFieldWithTitle(
                    title: 'Mật khẩu mới',
                    hintText: 'Nhập mật khẩu mới',
                    controller: _newPasswordController,
                    validator: (value) {
                      if (value!.length < 6) {
                        return 'Mật khẩu phải từ 6 kí tự trở lên';
                      }
                      return null;
                    },
                    onPressedIcon: showNewPassword,
                    hidePassword: hideNewPassword,
                  ),
                  const SizedBox(
                    height: SizesApp.s16,
                  ),
                  _buildTextFieldWithTitle(
                    title: 'Nhập lại mật khẩu',
                    hintText: 'Nhập lại mật khẩu mới',
                    controller: _typeAgainNewPasswordController,
                    validator: (value) {
                      if (value != _newPasswordController.text) {
                        return 'Mật khẩu không khớp';
                      }
                      return null;
                    },
                    onPressedIcon: showNewAgainPassword,
                    hidePassword: hideNewAgainPassword,
                  ),
                  const SizedBox(
                    height: SizesApp.s24,
                  ),
                  BackgroundButton(
                    text: 'Đổi mật khẩu',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        AuthRepository()
                            .changePassword(
                              newPassword: _typeAgainNewPasswordController.text,
                              currentPassword: _currentPasswordController.text,
                            )
                            .then((value) => {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Processing Data')),
                                  )
                                })
                            .then((value) {
                          Navigator.pop(context);
                        });
                      }
                    },
                    backgroundColor: ColorsApp.colorBorderButtonAndText,
                    isHaveIcon: false,
                  )
                ],
              ),
            )),
      ),
    ));
  }

  Widget _buildTextFieldWithTitle({
    required String title,
    required String hintText,
    required TextEditingController? controller,
    required String? Function(String?)? validator,
    required void Function()? onPressedIcon,
    required bool hidePassword,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: FontsApp().fontBodySmall,
        ),
        const SizedBox(
          height: SizesApp.s8,
        ),
        TextFormField(
          obscureText: hidePassword,
          validator: validator,
          cursorColor: ColorsApp.colorBorderButtonAndText,
          style: FontsApp().fontBodySmall,
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: IconWithButton(
              icon: Icon(
                hidePassword
                    ? Icons.remove_red_eye
                    : Icons.remove_red_eye_outlined,
                color: ColorsApp.colorBorderButtonAndText,
              ),
              onPressed: onPressedIcon,
            ),
            contentPadding: const EdgeInsets.all(SizesApp.s4),
            hintText: hintText,
            hintStyle: FontsApp().fontBodySmall,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: ColorsApp.colorBorderButtonAndText,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: ColorsApp.colorBorderButtonAndText,
              ), //<-- SEE HERE
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: ColorsApp.colorBorderButtonAndText,
              ), //<-- SEE HERE
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: ColorsApp.colorBorderButtonAndText,
              ), //<-- SEE HERE
            ),
          ),
        ),
      ],
    );
  }
}
