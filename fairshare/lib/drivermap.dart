// ignore_for_file: unused_import

import 'package:fairshare/Feedback.dart';
import 'package:fairshare/map.dart';
import 'package:fairshare/rate.dart';
import 'package:fairshare/register.dart';
import 'package:fairshare/settingpage.dart';
import 'package:fairshare/try2.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:tuple/tuple.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import 'package:vehicle_renting_and_sharing/settingpage.dart';
// ignore: unused_element
FirebaseAuth _auth = FirebaseAuth.instance;

class DriverMap extends StatefulWidget {
  const DriverMap({super.key});

  @override
  State<DriverMap> createState() => _DriverMapState();
}

class _DriverMapState extends State<DriverMap> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Driver')),
      // ignore: prefer_const_constructors
      body:   Center(
      child: Stack(
       
          children:  const [MapSample(),
        
        
          ],
      ),
    ),
    
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              color: Theme.of(context).primaryColor,
              width: double.infinity,
              child: Column(
                children: const <Widget>[
                  SizedBox(
                    width: 100,
                    height: 150,
                  )
                ],
              ),
            ),
            const ListTile(
              title: Text(
                "Home",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              leading: Icon(Icons.home),
              onTap: null,
            ),
            const ListTile(
              title: Text(
                "Travel history",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              leading: Icon(Icons.lock_clock_rounded),
              onTap: null,
            ),
            const ListTile(
              title: Text(
                "Intercity",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              leading: Icon(Icons.language),
              onTap: null,
            ),
            ListTile(
              title: const Text(
                "Active Status",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              leading: const Icon(Icons.how_to_reg_rounded),
              onTap: () {
             
          },
            ),
            GFToggle(
    onChanged: (val){},
    value: true,
 ),
           
            ListTile(
              title: const Text(
                "Setting",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  const ScheduleRide()));
              },
            ),
             ListTile(
              
              title: const Text(
                "Logout",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              leading: const Icon(Icons.logout),
              onTap: () {
           Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  const Register()));
          },
            ),
            ListTile(
              title: const Text(
                "Rate this app",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Rate()));
              },
            ),
          ],
        ),
      ),
       floatingActionButton: FloatingActionButton.extended(
  onPressed: () {
    showModalBottomSheet(
       context: context,
           
            builder: ((context) {
              return Material(
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: " location ",
                        labelText: " Your location",
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Destination",
                        labelText: "Enter Destination",
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "price",
                        labelText: " Offer your fare price",
                      ),
                    ),
                    
                   //String?selectVehicle;

Row(
  children: [
     const Text("Choose the vehicle:"),
        DropdownButton<String>(
    
     // value:selectVehicle,
    
      onChanged: (String? value) {
    
        setState(() {
    
       //  selectVehicle = value;
    
        });
    
      },
    
      // ignore: prefer_const_literals_to_create_immutables
    
      items: const [
    
        DropdownMenuItem(
    
          value: 'Bike',
    
          child: Text('Bike'),
    
        ),
    
        DropdownMenuItem(
    
          value: 'Car',
    
          child: Text('Car'),
    
        ),
    
      ],
      
    
    ),
  ],
),

                    const SizedBox(
                      height: 50.0,
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                            style: TextButton.styleFrom(
                                minimumSize: const Size(100, 80)),
                            onPressed: () {
                              //Navigator.pushNamed(context, MyRoutes.homeRoute);
                            },
                            child: const Text(
                              "Find a Driver",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              );
              // ignore: dead_code
              SizedBox(
                height: 400,
                child: Center(
                  child: ElevatedButton(
                    child: const Text('close'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              );
            })
    );
  },
  label: const Text('Search for Passenger'),
  icon: const Icon(Icons.search),
),
    );
  }
}