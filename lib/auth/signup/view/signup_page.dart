import '../../../constants/fonts.dart';
import '../../../constants/sizes.dart';
import '../../../wigdets/buttons.dart';
import '/auth/auth.dart';
import '/constants/colors.dart';
import '/widgets/appbar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _againPasswordController = TextEditingController();

  bool _emailValid(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/main',
              (route) => false,
            );
          }
          if (state is AuthError) {
            // Showing the error message if the user has entered invalid credentials
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Loading) {
              // Showing the loading indicator while the user is signing in
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UnAuthenticated) {
              // Showing the sign in form if the user is not authenticated
              return SafeArea(
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
                                      Navigator.pushNamedAndRemoveUntil(
                                          context, '/', (route) => false);
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
                                  cont: _emailController,
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
                                  cont: _passwordController,
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
                                  cont: _againPasswordController,
                                  isPassword: true,
                                  validator: ((value) {
                                    if (value == _passwordController.text) {
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
                                onPressed: () =>
                                    _createAccountWithEmailAndPassword(context),
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
            return Container();
          },
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

  void _createAccountWithEmailAndPassword(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SignUpRequested(
          _emailController.text,
          _againPasswordController.text,
        ),
      );
    }
  }
}
