// ignore_for_file: camel_case_types

import 'package:fairshare/map.dart';
import 'package:fairshare/rider.dart';
import 'package:flutter/material.dart';
//import 'package:vehicle_renting_and_sharing/rider.dart';

import 'driver.dart';

class ridrive extends StatefulWidget {
  const ridrive({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ridriveState createState() => _ridriveState();
}

class _ridriveState extends State<ridrive> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
          alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[const Text("Select the feature you would like to continue with:",style: TextStyle(fontSize: 20),),
            RadioListTile(
              value: 'rider',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value!;
                });
              },
              title: const Text('Rider'),
            ),
            RadioListTile(
              value: 'driver',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value!;
                });
              },
              title: const Text('Driver'),
            ),
            ElevatedButton(
              onPressed: () {
                
                if (_selectedOption == 'rider') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MapSample(),
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainDrawer(),
                    ),
                  );
                } else if (_selectedOption == 'driver') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DriverForm(),
                    ),
                  );
                }
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
