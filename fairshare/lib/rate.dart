// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';

void main() => runApp(const Rate());

class Rate extends StatelessWidget {
  const Rate({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Rating Prompt'),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
  
}

class _MyHomePageState extends State<MyHomePage> {
  final RateMyApp _rateApp = RateMyApp(
    preferencesPrefix: 'rateApp_',
    minDays: 3,
    minLaunches: 7,
    remindDays: 2,
    remindLaunches: 5,
    // appStoreIdentifier: '',
    // googlePlayIdentifier: '',
  );

  @override
  void initState() {
    super.initState();
    _rateApp.init().then((_) {
      // ignore: todo
      // TODO: Comment out this if statement to test rating dialog (Remember to uncomment)
      // if (_rateApp.shouldOpenDialog) {
      _rateApp.showStarRateDialog(
        context,
        title: 'How good have you found this app?',
        message: 'Please leave a rating!',
        actionsBuilder: (context, stars) {
          return [
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                if (stars != null) {
                  _rateApp.callEvent(RateMyAppEventType.rateButtonPressed).then((_) => Navigator.pop(context));

                  if (stars <= 3) {
                    print('Navigate to Contact Us Screen');
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (_) => ContactUsScreen(),
                    //   ),
                    // );
                  } else if (stars <= 5) {
                    print('Leave a Review Dialog');
                    // showDialog(...);
                  }
                } else {
                  Navigator.pop(context);
                }
              },
            ),
          ];
        },
        dialogStyle: const DialogStyle(
          titleAlign: TextAlign.center,
          messageAlign: TextAlign.center,
          messagePadding: EdgeInsets.only(bottom: 20.0),
        ),
        starRatingOptions: const StarRatingOptions(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(child: Text("Thankyou for the ratings!!",style: TextStyle(fontSize: 20),textAlign: TextAlign.center,))
    );
  }
}










