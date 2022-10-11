// import 'package:chat_app_b/Authenticate/forgot_password.dart';
// import 'package:chat_app_b/routes/routes.dart';
// import 'package:chat_app_b/wigdets/buttons.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import '../constants/colors.dart';
// import '../constants/fonts.dart';
// import '../constants/sizes.dart';
// import 'SignUpScreen.dart';
// import '../screens/HomeScreen.dart';
// import '/Authenticate/Methods.dart';
// import 'package:flutter/material.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _email = TextEditingController();
//   final TextEditingController _password = TextEditingController();
//   bool isLoading = false;
//   final _formKey = GlobalKey<FormState>();
//   bool _emailValid(String email) {
//     return RegExp(
//             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//         .hasMatch(email);
//   }

//   void _loginWithEmail() {
//     if (_formKey.currentState!.validate()) {
//       // If the form is valid, display a snackbar. In the real world,
//       // you'd often call a server or save the information in a database.
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Processing Data')),
//       );

//       if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
//         setState(() {
//           isLoading = true;
//         });

//         logIn(_email.text, _password.text).then((user) {
//           if (user != null) {
//             print("Login Sucessfull");
//             setState(() {
//               isLoading = false;
//             });
//             navigateTo(Routes.dashboard);
//           } else {
//             print("Login Failed");
//             setState(() {
//               isLoading = false;
//             });
//           }
//         });
//       } else {
//         print("Please fill form correctly");
//       }
//     }
//   }

//   void _loginWithGoole() {
//     try {
//       signInWithGoogle().then(
//         (user) {
//           if (user != null) {
//             print("Login Sucessfull");
//             setState(() {
//               isLoading = false;
//             });
//             navigateTo(Routes.dashboard);
//           } else {
//             print("Login Failed");
//             setState(() {
//               isLoading = false;
//             });
//           }
//         },
//       );
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(SizesApp.s16),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: IconButton(
//                             style: IconButton.styleFrom(
//                               minimumSize: const Size(0, 0),
//                               padding: EdgeInsets.zero,
//                               tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                             ),
//                             iconSize: SizesApp.s24,
//                             padding: const EdgeInsets.all(SizesApp.s4),
//                             icon: const Icon(Icons.arrow_back_ios),
//                             onPressed: () {
//                               navigateTo(Routes.intro);
//                             }),
//                       ),
//                       const SizedBox(
//                         height: SizesApp.s8,
//                       ),
//                       Image.asset(
//                         'assets/images/logo.png',
//                         width: SizesApp.s48 * 3,
//                       ),
//                       const SizedBox(
//                         height: SizesApp.s16,
//                       ),
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           'Đăng nhập',
//                           textAlign: TextAlign.start,
//                           style: FontsApp().fontBodyLarge,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: SizesApp.s16,
//                       ),
//                       Container(
//                         width: size.width,
//                         alignment: Alignment.center,
//                         child: field(
//                           size,
//                           hintText: 'Tài khoản',
//                           icon: Icons.email,
//                           cont: _email,
//                           isPassword: false,
//                           validator: ((value) {
//                             if (_emailValid(value!)) {
//                               return null;
//                             } else {
//                               return 'Email không đúng định dạng';
//                             }
//                           }),
//                         ),
//                       ),
//                       Container(
//                         width: size.width,
//                         alignment: Alignment.center,
//                         child: field(
//                           size,
//                           hintText: 'Mật khẩu',
//                           icon: Icons.lock_clock_rounded,
//                           cont: _password,
//                           isPassword: true,
//                           validator: ((value) {
//                             if (value!.length > 5) {
//                               return null;
//                             } else {
//                               return 'Mật khẩu phải từ 6 kí tự trở lên';
//                             }
//                           }),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(SizesApp.s16),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             Text(
//                               'Bạn quên mật khẩu?',
//                               style: FontsApp().fontBodySmall.copyWith(
//                                   color: ColorsApp.colorHintText,
//                                   fontSize: SizesApp.s14),
//                             ),
//                             const SizedBox(
//                               width: SizesApp.s4,
//                             ),
//                             TextButton(
//                               style: TextButton.styleFrom(
//                                   padding: EdgeInsets.zero,
//                                   minimumSize: const Size(0, 0),
//                                   tapTargetSize:
//                                       MaterialTapTargetSize.shrinkWrap),
//                               child: Text(
//                                 'Tại đây',
//                                 style: FontsApp()
//                                     .fontBodySmall
//                                     .copyWith(fontSize: SizesApp.s14),
//                               ),
//                               onPressed: () {
//                                 navigateTo(Routes.forgotPassword);
//                               },
//                             )
//                           ],
//                         ),
//                       ),
//                       OutlineButton(
//                         text: 'Đăng nhập',
//                         onPressed: _loginWithEmail,
//                       ),
//                       const SizedBox(
//                         height: SizesApp.s16,
//                       ),
//                       BackgroundButton(
//                         text: 'Đăng nhập với Google',
//                         onPressed: _loginWithGoole,
//                         backgroundColor: ColorsApp.googleColor,
//                         icon: FaIcon(
//                           FontAwesomeIcons.google,
//                           size: 24,
//                           color: ColorsApp.colorTheme,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             isLoading
//                 ? Container(
//                     color: ColorsApp.colorBorderButtonAndText,
//                     child: Center(
//                       child: CircularProgressIndicator(
//                         color: ColorsApp.colorTheme,
//                       ),
//                     ),
//                   )
//                 : const SizedBox(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget field(Size size,
//       {required String hintText,
//       required IconData icon,
//       required TextEditingController cont,
//       required bool isPassword,
//       required String? Function(String?)? validator}) {
//     return SizedBox(
//       height: SizesApp.s52 * 1.5,
//       width: size.width,
//       child: TextFormField(
//         validator: validator,
//         obscureText: isPassword,
//         cursorColor: ColorsApp.colorBorderButtonAndText,
//         controller: cont,
//         decoration: InputDecoration(
//           contentPadding: const EdgeInsets.all(SizesApp.s8),
//           prefixIcon: Icon(
//             icon,
//             color: ColorsApp.colorHintText,
//           ),
//           hintText: hintText,
//           hintStyle: FontsApp().fontBodySmall.copyWith(
//                 color: ColorsApp.colorHintText,
//               ),
//           border: OutlineInputBorder(
//             borderSide: BorderSide(
//                 color: ColorsApp.colorFocusField, width: SizesApp.s2),
//             borderRadius: BorderRadius.circular(SizesApp.s20),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//                 color: ColorsApp.colorFocusField, width: SizesApp.s2),
//             borderRadius: BorderRadius.circular(SizesApp.s20),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//                 color: ColorsApp.colorBorderButtonAndText, width: SizesApp.s1),
//             borderRadius: BorderRadius.circular(SizesApp.s20),
//           ),
//         ),
//       ),
//     );
//   }
// }
