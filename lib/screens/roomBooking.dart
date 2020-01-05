import 'package:flutter/material.dart';
import 'package:hifi_prot/providers/Provider.dart';
import 'package:hifi_prot/widgets/Drawer.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class RoomBooking extends StatefulWidget {
  static const String routeName = '/bookScreen';

  @override
  State<StatefulWidget> createState() {
    return _RoomBooking();
  }
}

class _RoomBooking extends State<RoomBooking> {
  String _building;
  String _time;
  List<Widget> _items = [];



  @override
  Widget build(BuildContext context) {

    final productsProvider = Provider.of<classProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Room Booking',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      drawer: buildDrawer(context),
      body: Container(

        padding: EdgeInsets.all(30),
        child: Column(

          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width:90,
                  child: DropdownButton(
                    value: _building,
                    icon: Icon(Icons.home),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Colors.black,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        _building = newValue;
                      });
                    },
                    items: <String>['ravelijn', 'waaier', 'vrijhof', 'technohal']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),

                SizedBox(
                  width: 30,
                ),

                Container(
                  width: 100,
                  child: DropdownButton(
                    value: _time,
                    icon: Icon(Icons.timelapse),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Colors.black,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        _time = newValue;
                      });
                    },
                    items: <String>[DateFormat("dd-MM-yyyy").format(DateTime.now().add(Duration(days: 0))).toString(), DateFormat("dd-MM-yyyy").format(DateTime.now().add(Duration(days: 1))).toString(), DateFormat("dd-MM-yyyy").format(DateTime.now().add(Duration(days: 2))).toString(), DateFormat("dd-MM-yyyy").format(DateTime.now().add(Duration(days: 3))).toString()]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),

                SizedBox(
                  width: 30,
                ),

                FlatButton(
                  color: Colors.blue,
                  child: Text('Search',style: TextStyle(color: Colors.white),),
                  onPressed: (){
                    setState(() {
                      _items = productsProvider.getLocationTime(_building, _time);
                    });

                  },
                )
              ],
            ),

            SizedBox(height: 30,),

            Flexible(
              child: ListView(
                children: _items,
              ),
            )


          ],
        ),

      ),
    );
  }
}
