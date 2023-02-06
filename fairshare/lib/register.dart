
// ignore_for_file: unused_import, non_constant_identifier_names, prefer_const_constructors

//import 'dart:html';

import 'package:fairshare/auth.dart';
import 'package:fairshare/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unnecessary_import
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
FirebaseAuth auth = FirebaseAuth.instance;
void main() {
  runApp( MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  //String? verify;

  static String verify="";

   const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('verify', verify));
    properties.add(StringProperty('verify', verify));
  }
}

class _MyAppState extends State<MyApp> {
 TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  validateform()
  {
    if(name.text.length <3)
    {
      Fluttertoast.showToast(msg: "name must be of atleast 3 characters");
    }
    else if(phoneNumber.text.length!=10)
    {
      Fluttertoast.showToast(msg: "Please add a valid phone number");
    }
    // else{
    //   registerinfo();
    // }
  }
// registerinfo()
// {
//   showDialog
//     {context : context,
//     barrierDismissible : false,
//     builder: BuildContext c}
//       {
//         return ProgressIndicator( Text("Please Wait"));
//       }
// }
// final User? firebaseUser =(
// await fAuth.signInWithCredential(
//   name:name.text.trim(),
//   phone:phoneNumber.text.trim()).catchError((msg{
//     Navigator.pop(context);
//     Fluttertoast.showToast(msg:"Error:"+msg.toString());
//   })),
// ).user;


  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Welcome to Flutter',
        home: Scaffold(
            // appBar: AppBar(
            //     title: const Text('Welcome to Flutter',
            //         textAlign: TextAlign.center),
            //     backgroundColor: Colors.black
            //     ),
            body: 
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25),
              alignment: Alignment.center,
              child: SingleChildScrollView(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                  (const Text(
                    'Register to share your journey',
                      textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                  )),
                  Image.asset(
                    'assests/scooty.jpg',
                    width: 150,
                    height: 150,
                  ),

                  //name
                   Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      controller: name,
                      validator: (value) {
                if (value == null || value.isEmpty) {
              return 'Please enter some text';
                }
                return null;
              },
               keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your name',
                          labelText: 'Name'),
                    ),
                  ),

                  //phone
                   Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      controller: phoneNumber,
                      // onChanged: (value) {
                      //   phone=value;
                      // },
                      validator: (value) {
                if (value == null || value.isEmpty) {
              return 'Please enter some text';
                }
                return null;
              },
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '9876543210',
                          labelText: 'Phone'),
                    ),
                  ),

                  //next
                  SizedBox(
                    width: double.infinity,
                height: 45,
                    child: ElevatedButton(
                       onPressed: () async {
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: '+977 655-555-1209', 
                          timeout: const Duration(seconds: 60),
                          verificationCompleted:
                              (PhoneAuthCredential credential) {
                                auth.signInWithCredential(credential).then((value) => {("you are logged in successfully")});
                            },
                          verificationFailed: (FirebaseAuthException e) {},
                          codeSent: (String verificationId, int? resendToken) {
                           // MyApp.verify=verificationId;
                            Navigator.pushNamed(context, 'verify');
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                           
                        );
                        //verify code till here
                      },//async
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child:const Text('Register'),
                      onLongPress: () {
                        validateform();
                        Navigator.pushNamed(context, 'verify');
                      },
                      
                    ),
                    
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(30.0),
                  //   child: Row(
                  //  
                  //     children: [
                  //       Image.asset(
                  //           'assests/th.jpeg', cacheHeight: 100,cacheWidth: 200,),
                  //           const Text("Lets go", style: TextStyle(fontSize: 40),)
                           
                  //     ],
                  //   ),
                  // ),
                Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          'phone',
                          (route) => false,
                        );
                      },
                      child: const Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              )
                ],
              )
              ),
            )));
  }
}
// void insertData(String name, Number phoneNumber)
// {
//   databaseRef.child("path").set({
//     'name': name,
//     'phone': phoneNumber
//   });
//   name.clear();
//   phone.clear();

// }
