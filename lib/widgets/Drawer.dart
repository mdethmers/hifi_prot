import 'package:flutter/material.dart';
import 'package:hifi_prot/screens/homeScreen.dart';
import 'package:hifi_prot/screens/roomBooking.dart';


Drawer buildDrawer(context) {

  return Drawer(

      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Menu'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Booking'),
            onTap: () {
              Navigator.pushReplacementNamed(context, RoomBooking.routeName);

            },
          ),
          ListTile(
            title: Text('Timetable'),
            onTap: () {
              //update the state of app
              //...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Events'),
            onTap: () {

              Navigator.pushReplacementNamed(context, homeScreen.routeName);

            },
          ),
          ListTile(
            title: Text('Settings'),
            onTap: () {
              //update the state of app
              //...
              // Then close the drawer
              Navigator.pop(context);
            },
          )
        ],
      )
  );
}