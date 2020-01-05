import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class classProvider with ChangeNotifier {



  List<Widget> getLocationTime(String location, String time) {

    List rdm = [];

    for(int i = 0; i < 6; i++){
      rdm.add(Random.secure().nextInt(20));
    }

    return [
      Card(
        child: ListTile(
          title: Text('room ${location} in hk2501'),
          leading: Container(width: 40, child: Row(children: <Widget>[Text(Random.secure().nextInt(20).toString()) , Icon(Icons.airline_seat_legroom_normal),],),),
          subtitle: Text('available from 12.00 till 13.00 '),
          onTap: (){

          },
        ),
      ),
      Card(
        child: ListTile(
          title: Text('room ${location} in vf23010'),
          leading: Container(width: 40, child: Row(children: <Widget>[Text(Random.secure().nextInt(20).toString()) , Icon(Icons.airline_seat_legroom_normal),],),),
          subtitle: Text('available from 12.00 till 13.00'),
          onTap: (){

          },
        ),
      ),
      Card(
        child: ListTile(
          title: Text('room ${location} in hk2301'),
          leading: Container(width: 40, child: Row(children: <Widget>[Text(Random.secure().nextInt(20).toString()) , Icon(Icons.airline_seat_legroom_normal),],),),
          subtitle: Text('available from 14.00 till 18.00'),
          onTap: (){

          },
        ),
      ),
      Card(
        child: ListTile(
          title: Text('room ${location} in RK1010'),
          leading: Container(width: 40, child: Row(children: <Widget>[Text(Random.secure().nextInt(20).toString()) , Icon(Icons.airline_seat_legroom_normal),],),),
          subtitle: Text('available from 9.00 till 20.00'),
          onTap: (){

          },
        ),
      ),
      Card(
        child: ListTile(
          title: Text('room ${location} in G103'),
          leading: Container(width: 40, child: Row(children: <Widget>[Text(Random.secure().nextInt(20).toString()) , Icon(Icons.airline_seat_legroom_normal),],),),
          subtitle: Text('available from 12.30 till 15.00'),
          onTap: (){

          },
        ),
      ),
    ];
  }
}
