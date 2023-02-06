import 'package:flutter/material.dart';
//import '../utils/routes.dart';

class Widget029 extends StatefulWidget {
  const Widget029({Key? key}) : super(key: key);

  @override
  State<Widget029> createState() => _Widget029State();
}

class _Widget029State extends State<Widget029> {
  List<String> vehicleType=["Bike","Car"];
  String? selectVehicle;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('Model Botttom sheet'),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
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
                    
                    DropdownButton(hint: const Text ('choose your vehicle'), 
                    value: selectVehicle,
                     items:vehicleType.map((e) {
                       return const DropdownMenuItem
                       (child: Text("Vehicle"),);
                     }).toList(), 
                     onChanged: (newvalue) {
                      setState(() {
                        selectVehicle= newvalue.toString();
                      });
                       },),
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
            }),
          );
        },
      ),
    );
  }
}