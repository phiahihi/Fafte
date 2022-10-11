// import 'package:chat_app_b/Authenticate/forgot_password.dart';
// import 'package:chat_app_b/routes/routes.dart';
// import 'package:chat_app_b/wigdets/buttons.dart';

// import '../constants/colors.dart';
// import '../constants/fonts.dart';
// import '../constants/sizes.dart';
// import 'SignUpScreen.dart';
// import '../screens/HomeScreen.dart';
// import '/Authenticate/Methods.dart';
// import 'package:flutter/material.dart';

// class ForgotPassword extends StatefulWidget {
//   const ForgotPassword({super.key});

//   @override
//   _ForgotPasswordState createState() => _ForgotPasswordState();
// }

// class _ForgotPasswordState extends State<ForgotPassword> {
//   final TextEditingController _email = TextEditingController();
//   bool isLoading = false;
//   final _formKey = GlobalKey<FormState>();
//   bool _emailValid(String email) {
//     return RegExp(
//             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//         .hasMatch(email);
//   }

//   void _forgotPassword() {
//     if (_formKey.currentState!.validate()) {
//       // If the form is valid, display a snackbar. In the real world,
//       // you'd often call a server or save the information in a database.
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Processing Data')),
//       );

//       if (_email.text.isNotEmpty) {
//         setState(() {
//           isLoading = true;
//         });

//         forgotPassword(_email.text).then((user) {
//           print("Login Sucessfull");
//           setState(() {
//             isLoading = false;
//           });
//           Navigator.pop(context);
//         });
//       } else {
//         print("Please fill form correctly");
//       }
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
//                             icon: const Icon(Icons.arrow_back_ios),
//                             onPressed: () {
//                               navigateTo(Routes.login);
//                             }),
//                       ),
//                       const SizedBox(
//                         height: SizesApp.s8,
//                       ),
//                       Image.asset(
//                         'assets/images/logo.png',
//                         width: SizesApp.s48 * 4,
//                       ),
//                       const SizedBox(
//                         height: SizesApp.s16,
//                       ),
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           'Quên mật khẩu',
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
//                       OutlineButton(
//                         text: 'Gửi',
//                         onPressed: _forgotPassword,
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
