// import 'package:chat_app_b/Authenticate/forgot_password.dart';
// import 'package:chat_app_b/routes/routes.dart';
// import 'package:chat_app_b/wigdets/buttons.dart';

// import '../constants/colors.dart';
// import '../constants/fonts.dart';
// import '../constants/sizes.dart';
// import '/Authenticate/Methods.dart';
// import 'package:flutter/material.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({super.key});

//   @override
//   _SignUpState createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   final TextEditingController _email = TextEditingController();
//   final TextEditingController _password = TextEditingController();
//   final TextEditingController _againPassword = TextEditingController();

//   bool isLoading = false;
//   final _formKey = GlobalKey<FormState>();


//   void _signup() {
//     if (_formKey.currentState!.validate()) {
//       // If the form is valid, display a snackbar. In the real world,
//       // you'd often call a server or save the information in a database.
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Processing Data')),
//       );

//       if (_email.text.isNotEmpty &&
//           _email.text.isNotEmpty &&
//           _password.text.isNotEmpty) {
//         setState(() {
//           isLoading = true;
//         });

//         createAccount(_email.text, _email.text, _againPassword.text)
//             .then((user) {
//           if (user != null) {
//             setState(() {
//               isLoading = false;
//             });
//             navigateTo(Routes.home);
//             print("Account Created Sucessfull");
//           } else {
//             print("Login Failed");
//             setState(() {
//               isLoading = false;
//             });
//           }
//         });
//       } else {
//         print("Please enter Fields");
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: 
//     );
//   }

  
// }
