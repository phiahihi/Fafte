import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/fonts.dart';
import '../../../constants/sizes.dart';
import '../../../wigdets/buttons.dart';
import '/auth/auth.dart';
import '/constants/colors.dart';
import '/widgets/appbar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Authenticated) {
              print(state);
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
              print(state);

              if (state is Loading) {
                return Center(
                  child: CircularProgressIndicator(
                      color: ColorsApp.colorBorderButtonAndText),
                );
              }
              if (state is UnAuthenticated) {
                // Showing the sign in form if the user is not authenticated
                return Stack(
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
                                    style: IconButton.styleFrom(
                                      minimumSize: const Size(0, 0),
                                      padding: EdgeInsets.zero,
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    iconSize: SizesApp.s24,
                                    padding: const EdgeInsets.all(SizesApp.s4),
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
                                width: SizesApp.s48 * 3,
                              ),
                              const SizedBox(
                                height: SizesApp.s16,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Đăng nhập',
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
                                    return value != null &&
                                            !EmailValidator.validate(value)
                                        ? 'Enter a valid email'
                                        : null;
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
                              Padding(
                                padding: const EdgeInsets.all(SizesApp.s16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Bạn quên mật khẩu?',
                                      style: FontsApp().fontBodySmall.copyWith(
                                          color: ColorsApp.colorHintText,
                                          fontSize: SizesApp.s14),
                                    ),
                                    const SizedBox(
                                      width: SizesApp.s4,
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          minimumSize: const Size(0, 0),
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap),
                                      child: Text(
                                        'Tại đây',
                                        style: FontsApp()
                                            .fontBodySmall
                                            .copyWith(fontSize: SizesApp.s14),
                                      ),
                                      onPressed: () {
                                        Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            '/forgot_password',
                                            (route) => false);
                                      },
                                    )
                                  ],
                                ),
                              ),
                              OutlineButton(
                                text: 'Đăng nhập',
                                onPressed: () {
                                  _authenticateWithEmailAndPassword(context);
                                },
                              ),
                              const SizedBox(
                                height: SizesApp.s16,
                              ),
                              BackgroundButton(
                                isHaveIcon: true,
                                text: 'Đăng nhập với Google',
                                onPressed: () {
                                  _authenticateWithGoogle(context);
                                },
                                backgroundColor: ColorsApp.googleColor,
                                icon: FaIcon(
                                  FontAwesomeIcons.google,
                                  size: 24,
                                  color: ColorsApp.colorTheme,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
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

  void _authenticateWithEmailAndPassword(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SignInRequested(_emailController.text, _passwordController.text),
      );
    }
  }

  void _authenticateWithGoogle(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(
      GoogleSignInRequested(),
    );
  }
}
