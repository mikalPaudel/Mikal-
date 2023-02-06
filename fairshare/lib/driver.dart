import 'package:fairshare/map.dart';
import 'package:fairshare/rate.dart';
import 'package:fairshare/register.dart';
import 'package:fairshare/settingpage.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class DriverForm extends StatefulWidget {
  const DriverForm({super.key});
  

  @override
  State<DriverForm> createState() => _DriverFormState();
}

class _DriverFormState extends State<DriverForm> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Driver')),
      body:  
      Container( 
        padding: const EdgeInsets.symmetric(vertical: 25.0,horizontal: 25.0),
       child: SingleChildScrollView( child: Form(
         // key: _DriverFormKey,
          child: Column(
                    children: <Widget>[
                       Padding(
                        padding: const EdgeInsets.all(10.0),
                      child:TextFormField(
                        // validator:(Stringmsg) {
                        // },
                        decoration: InputDecoration(
                          labelText: "Vehicle",
                          hintText: "Enter the type of Vehicle",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1.0)
                          )
                        ),
                      ),
                      
                      ),
                       Padding(
                        padding: const EdgeInsets.all(10.0),
                      child:TextFormField(
                        keyboardType: TextInputType.phone,
                        // validator:(Stringmsg) {
                        // },
                        decoration: InputDecoration(
                          labelText: "Licence Number",
                          hintText: "Enter your Licence number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1.0)
                          )
                        ),
                      ),
                      
                      ),
                       Padding(
                        padding: const EdgeInsets.all(10.0),
                      child:TextFormField(
                        keyboardType: TextInputType.phone,
                        // validator:(Stringmsg) {
                        // },
                        decoration: InputDecoration(
                          labelText: "Number Plate",
                          hintText: "Enter your number Plate",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1.0)
                          )
                        ),
                      ),
                      
                      ),
                      ElevatedButton(
                        onPressed: () {
                        Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MapSample()));
                        },
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
        )
      )
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
          ],
        ),
      ),
    );
  }
}