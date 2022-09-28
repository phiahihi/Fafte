import 'package:chat_app_b/Authenticate/forgot_password.dart';
import 'package:chat_app_b/routes/routes.dart';
import 'package:chat_app_b/wigdets/buttons.dart';

import '../constants/colors.dart';
import '../constants/fonts.dart';
import '../constants/sizes.dart';
import '/Authenticate/Methods.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _againPassword = TextEditingController();

  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  bool _emailValid(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  void _signup() {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );

      if (_email.text.isNotEmpty &&
          _email.text.isNotEmpty &&
          _password.text.isNotEmpty) {
        setState(() {
          isLoading = true;
        });

        createAccount(_email.text, _email.text, _againPassword.text)
            .then((user) {
          if (user != null) {
            setState(() {
              isLoading = false;
            });
            navigateTo(Routes.home);
            print("Account Created Sucessfull");
          } else {
            print("Login Failed");
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        print("Please enter Fields");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(SizesApp.s16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            icon: const Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              navigateTo(Routes.intro);
                            }),
                      ),
                      const SizedBox(
                        height: SizesApp.s8,
                      ),
                      Image.asset(
                        'assets/images/logo.png',
                        width: SizesApp.s48 * 4,
                      ),
                      const SizedBox(
                        height: SizesApp.s16,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Đăng kí',
                          textAlign: TextAlign.start,
                          style: FontsApp().fontBodyLarge,
                        ),
                      ),
                      const SizedBox(
                        height: SizesApp.s16,
                      ),
                      Container(
                        width: size.width,
                        alignment: Alignment.center,
                        child: field(
                          size,
                          hintText: 'Tài khoản',
                          icon: Icons.email,
                          cont: _email,
                          isPassword: false,
                          validator: ((value) {
                            if (_emailValid(value!)) {
                              return null;
                            } else {
                              return 'Email không đúng định dạng';
                            }
                          }),
                        ),
                      ),
                      Container(
                        width: size.width,
                        alignment: Alignment.center,
                        child: field(
                          size,
                          hintText: 'Mật khẩu',
                          icon: Icons.lock_clock_rounded,
                          cont: _password,
                          isPassword: true,
                          validator: ((value) {
                            if (value!.length > 5) {
                              return null;
                            } else {
                              return 'Mật khẩu phải từ 6 kí tự trở lên';
                            }
                          }),
                        ),
                      ),
                      Container(
                        width: size.width,
                        alignment: Alignment.center,
                        child: field(
                          size,
                          hintText: 'Nhập lại mật khẩu',
                          icon: Icons.lock_clock_rounded,
                          cont: _againPassword,
                          isPassword: true,
                          validator: ((value) {
                            if (value == _password.text) {
                              return null;
                            } else {
                              return 'Mật khẩu không khớp';
                            }
                          }),
                        ),
                      ),
                      const SizedBox(
                        height: SizesApp.s48,
                      ),
                      OutlineButton(
                        text: 'Đăng kí',
                        onPressed: _signup,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            isLoading
                ? Container(
                    color: ColorsApp.colorBorderButtonAndText,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: ColorsApp.colorTheme,
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget field(Size size,
      {required String hintText,
      required IconData icon,
      required TextEditingController cont,
      required bool isPassword,
      required String? Function(String?)? validator}) {
    return SizedBox(
      height: SizesApp.s52 * 1.5,
      width: size.width,
      child: TextFormField(
        validator: validator,
        obscureText: isPassword,
        cursorColor: ColorsApp.colorBorderButtonAndText,
        controller: cont,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(SizesApp.s8),
          prefixIcon: Icon(
            icon,
            color: ColorsApp.colorHintText,
          ),
          hintText: hintText,
          hintStyle: FontsApp().fontBodySmall.copyWith(
                color: ColorsApp.colorHintText,
              ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorsApp.colorFocusField, width: SizesApp.s2),
            borderRadius: BorderRadius.circular(SizesApp.s20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorsApp.colorFocusField, width: SizesApp.s2),
            borderRadius: BorderRadius.circular(SizesApp.s20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorsApp.colorBorderButtonAndText, width: SizesApp.s1),
            borderRadius: BorderRadius.circular(SizesApp.s20),
          ),
        ),
      ),
    );
  }
}
