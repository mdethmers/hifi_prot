import 'package:flutter/material.dart';

import 'package:hifi_prot/widgets/Drawer.dart';

class homeScreen extends StatefulWidget {

  static const String routeName = '/homeScreen' ;

  @override
  State<StatefulWidget> createState() {
    return _homeScreen();
  }

}

class _homeScreen extends State<homeScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Events on campus', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      drawer: buildDrawer(context),

//      body: GridView.builder( //implement some sort of news overview with dummy data using the itembuilder
//          gridDelegate: null,
//          itemCount: null,
//          itemBuilder: null
//      ),//make body here
    );
  }

}