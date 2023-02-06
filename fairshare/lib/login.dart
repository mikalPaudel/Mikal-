// import 'package:flutter/material.dart';

// //import 'package:fairshare/utils/routes.dart';

// class Loginpage extends StatelessWidget {
//   const Loginpage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Column(
//         children: [
//           Column(
//             children: [
//               const Text("Welcome",
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                   )),
//               Image.asset(
//                 'assets/login.jpg',
//                 cacheHeight: 200,
//                 cacheWidth: 200,
//               )
//             ],
//           ),
//           const SizedBox(
//             height: 50.0,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 TextFormField(
//                   decoration: const InputDecoration(
//                     hintText: "Enter username",
//                     labelText: "Username",
//                   ),
//                 ),
                // TextFormField(
                //   obscureText: true,
                //   decoration: const InputDecoration(
                //     hintText: "Enter password",
                //     labelText: "password",
                //   ),
//                 ),
//                 const SizedBox(
//                   height: 50.0,
//                 ),
//                 ElevatedButton(
//                     style:
//                         TextButton.styleFrom(minimumSize: const Size(150, 40)),
//                     onPressed: () {
//                       Navigator.pushNamed(context, MyRoutes.homeRoute);
//                     },
//                     child: const Text("Login")),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
//}