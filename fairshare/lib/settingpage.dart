// ignore_for_file: avoid_print, unused_element

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

class ScheduleRide extends StatefulWidget {
  const ScheduleRide({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ScheduleRideState createState() => _ScheduleRideState();
}

class _ScheduleRideState extends State<ScheduleRide> {
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();
 String? _selectedFrequency = 'Once a week';
String? _selectedDuration = '1 month';

// void addDataToFirestore(String passengerName, String driverName, String vehicleModel, String travelTime) {
//   FirebaseFirestore.instance.collection('passengers').add({
//     'name': passengerName,
//     'travel_time': travelTime,
//   });

//   FirebaseFirestore.instance.collection('drivers').add({
//     'name': driverName,
//     'vehicle_model': vehicleModel,
//   });

//   FirebaseFirestore.instance.collection('vehicles').add({
//     'model': vehicleModel,
//     'driver_name': driverName,
//   });

//   FirebaseFirestore.instance.collection('travels').add({
//     'passenger_name': passengerName,
//     'driver_name': driverName,
//     'vehicle_model': vehicleModel,
//     'travel_time': travelTime,
//   });
// }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule a Ride'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Starting address:",style: TextStyle(fontSize: 20),),
              ), 
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextFormField(decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Talchikhel',),
                    ),
             ),
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text("Destination address:",style: TextStyle(fontSize: 20)),
                    ), 
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextFormField(decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Boudha',),
                    ),
             ),
              Row(
                children: [
                  Text(
                    'Date: ${DateFormat('yyyy-MM-dd').format(_date)}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: const Text('Select date'),
                ),
              ),
                ],
                
              ),
              
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Time: ${_time.format(context)}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => _selectTime(context),
                  child: const Text('Select time'),
                ),
              ),
                ],
              ),
              
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    'Frequency:',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: DropdownButton<String>(
  value: _selectedFrequency,
  onChanged: (String? newValue) {
    setState(() {
        _selectedFrequency = newValue;
    });
  },
  items: <String>[    'Once a week',    'Once a day',    'Twice a week',    'Custom',  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
    );
  }).toList(),
),
             ),
                ],
              ),
              
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    'Duration:',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(
  value: _selectedDuration,
  onChanged: (String? newValue) {
    setState(() {
        _selectedDuration = newValue;
    });
  },
  items: <String>[    '1 month',    '3 months',    '6 months',    'Custom',  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
    );
  }).toList(),
),
              ),
                ],
              ),
              

              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    //addDataToFirestore();
                    },
                  child: const Text('Subscribe'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
