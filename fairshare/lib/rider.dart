// ignore_for_file: unused_import

import 'package:fairshare/feedback.dart';
import 'package:fairshare/rate.dart';
import 'package:fairshare/register.dart';
import 'package:fairshare/settingpage.dart';
import 'package:fairshare/try2.dart';
import 'package:flutter/material.dart';
//import 'package:vehicle_renting_and_sharing/settingpage.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  List<String> vehicleType=["Bike","Car"];
  String? selectVehicle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rider')),
      body:   Center(
      child: ElevatedButton(
        child: const Text('Find a driver?'),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)
                    )
                    ),
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
                    // TextFormField(
                    //   decoration: const InputDecoration(
                    //     hintText: "price",
                    //     labelText: " Offer your fare price",
                    //   ),
                    //),
                    

                    // DropdownButton(hint: const Text ('choose your vehicle'), 
                    // value: selectVehicle,
                    //  items:vehicleType.map((e) {
                    //    return const DropdownMenuItem
                    //    (child: Text("Vehicle"),);
                    //  }).toList(), 
                    //  onChanged: (newvalue) {
                    //   setState(() {
                    //     selectVehicle= newvalue.toString();
                    //   });
                    //    },),

                    const SizedBox(
                      height: 50.0,
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                            style: TextButton.styleFrom(
                                minimumSize: const Size(300, 80)),
                            onPressed: () {
                              //Navigator.pushNamed(context, MyRoutes.homeRoute);
                              },
                            child: const Text(
                              "Find a Driver",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ),
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
            }),
          );
        },
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
                  ),
                Text("Hello Rider!!",style: TextStyle(fontSize: 20),textAlign: TextAlign.right,)],
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
                "Setting",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SettingPage()));
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
                    MaterialPageRoute(builder: (context) =>  const MyApp()));
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
             ListTile(
              title: const Text(
                "Feedback",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              leading: const Icon(Icons.language),
              onTap: (){Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const feedback()));},
            ),
          ],
        ),
      ),
      
    );
  }
}