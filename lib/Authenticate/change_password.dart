// import '/Authenticate/Methods.dart';
// import 'package:flutter/material.dart';

// class ChangePassword extends StatefulWidget {
//   const ChangePassword({super.key});

//   @override
//   _ChangePasswordState createState() => _ChangePasswordState();
// }

// class _ChangePasswordState extends State<ChangePassword> {
//   final TextEditingController _email = TextEditingController();
//   bool isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: isLoading
//           ? Center(
//               child: SizedBox(
//                 height: size.height / 20,
//                 width: size.height / 20,
//                 child: const CircularProgressIndicator(),
//               ),
//             )
//           : SingleChildScrollView(
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: size.height / 20,
//                   ),
//                   Container(
//                     alignment: Alignment.centerLeft,
//                     width: size.width / 0.5,
//                     child: IconButton(
//                         icon: const Icon(Icons.arrow_back_ios),
//                         onPressed: () {
//                           Navigator.pop(context);
//                         }),
//                   ),
//                   SizedBox(
//                     height: size.height / 50,
//                   ),
//                   SizedBox(
//                     width: size.width / 1.1,
//                     child: const Text(
//                       "Welcome",
//                       style: TextStyle(
//                         fontSize: 34,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: size.width / 1.1,
//                     child: Text(
//                       "Forgot password",
//                       style: TextStyle(
//                         color: Colors.grey[700],
//                         fontSize: 25,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: size.height / 10,
//                   ),
//                   Container(
//                     width: size.width,
//                     alignment: Alignment.center,
//                     child: field(size, "email", Icons.account_box, _email),
//                   ),
//                   SizedBox(
//                     height: size.height / 10,
//                   ),
//                   customButton(size),
//                   SizedBox(
//                     height: size.height / 40,
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }

//   Widget customButton(Size size) {
//     return GestureDetector(
//       onTap: () {
//         if (_email.text.isNotEmpty) {
//           setState(() {
//             isLoading = true;
//           });

//           changePassword(_email.text).then((user) {
//             print("Login Sucessfull");
//             setState(() {
//               isLoading = false;
//             });
//             Navigator.pop(context);
//           });
//         } else {
//           print("Please fill form correctly");
//         }
//       },
//       child: Container(
//           height: size.height / 14,
//           width: size.width / 1.2,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5),
//             color: Colors.blue,
//           ),
//           alignment: Alignment.center,
//           child: const Text(
//             "Send Password",
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           )),
//     );
//   }

//   Widget field(
//       Size size, String hintText, IconData icon, TextEditingController cont) {
//     return SizedBox(
//       height: size.height / 14,
//       width: size.width / 1.1,
//       child: TextField(
//         controller: cont,
//         decoration: InputDecoration(
//           prefixIcon: Icon(icon),
//           hintText: hintText,
//           hintStyle: const TextStyle(color: Colors.grey),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//       ),
//     );
//   }
// }
