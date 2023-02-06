
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:feedback/feedback.dart';

void main() {
  runApp(const feedback());
}

class feedback extends StatelessWidget {
  const feedback({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BetterFeedback(
      theme: FeedbackThemeData(
          background: const Color(0xff00569e),
          drawColors: [
            Colors.black87,
            Colors.blue,
            Colors.red,
            Colors.green
          ]
      ),

      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: prefer_typing_uninitialized_variables
  var image;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(" Feedback"),
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("If you have any problem using this app, you can send us your feedback. Glad to serve you :) ",
          style: TextStyle(
              fontSize: 18), textAlign:TextAlign.center
          ,),
          ElevatedButton(onPressed: (){
            BetterFeedback.of(context).show((p0) {
              setState(() {
                image = p0.screenshot;
              });
              // ignore: avoid_print
              print (p0.text);
            });
          },style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xffff31b9))),
           child: const Text("Give Feedback"),),
          if(image!=null)
            SizedBox(
              height: 150,
              child: Image.memory(image),
            )
        ],
      ),
    );
  }



}




