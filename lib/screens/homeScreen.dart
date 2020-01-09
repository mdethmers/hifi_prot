import 'package:flutter/material.dart';
import 'package:hifi_prot/providers/Provider.dart' as prefix0;

import 'package:hifi_prot/widgets/Drawer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class homeScreen extends StatefulWidget {
  static const String routeName = '/homeScreen';

  @override
  State<StatefulWidget> createState() {
    return _homeScreen();
  }
}

class _homeScreen extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    final _classProvider = Provider.of<prefix0.classProvider>(context);
    final List _events = _classProvider.getEvents;

    Widget _STTresult = SpinKitDoubleBounce(
      color: Colors.red,
      size: 100,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Events on campus',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      drawer: buildDrawer(context),

      body: GridView.builder(
        //implement some sort of news overview with dummy data using the itembuilder
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: _events.length,
          itemBuilder: (ctx, i) {
            return Container(
              padding: EdgeInsets.all(10),
              child: Card(
                elevation: 10,
                color: Colors.white,
                child: InkWell(
                  onTap: (){},
                  child: Column(
                    children: <Widget>[
                      Image(
                        image: AssetImage(_events[i][2]),
                        width: double.infinity,
                        fit: BoxFit.fitWidth,
                        height: 200,
                      ),
                      Container(
                        child: Text(
                          _events[i][0].toString().toUpperCase(),
                          style: TextStyle(fontSize: 30),),),
                      Flexible(child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(_events[i][1], style: TextStyle(color: Colors.grey, fontSize: 15),),
                      ),),
                    ],
                  ),
                ),
              ),
            );
          }),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.mic),
        onPressed: (){


          _classProvider.listenToUser(context);

          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40.0))),
                  title: new Text(
                    "Listening",
                    textAlign: TextAlign.center,
                  ),
                  content: Container(
                    height: 70,
                    child: _STTresult,
                  ),
                  actions: <Widget>[
                    // usually buttons at the bottom of the dialog
                    new FlatButton(
                      child: new Text("Stop"),
                      onPressed: () {
                        _classProvider.stopListening(context);
                      },
                    ),
                    new FlatButton(
                      child: new Text("Cancel"),
                      onPressed: () {
                        _classProvider.cancelListening(context);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
        },
      ),//make body here
    );
  }
}
