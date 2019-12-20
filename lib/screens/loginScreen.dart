import 'package:flutter/material.dart';

class loginScreen extends StatelessWidget {

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
        fit: BoxFit.cover,
        colorFilter:
        ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
        image: NetworkImage('https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwjmjcDi6rzmAhXP0qQKHROYD4IQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.utwente.nl%2Fen%2Fcampus%2Fbuildings-rules%2F&psig=AOvVaw04isX43L9vDEVywtqH4fLL&ust=1576677275342892'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
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
                //update the state of app
                //...
                // Then close the drawer
                Navigator.pop(context);
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
                //update the state of app
                //...
                // Then close the drawer
                Navigator.pop(context);
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
      ),
      appBar: AppBar(
        title: Text('asssistant', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.limeAccent,
        
      ),
      body: Container(
        child: FloatingActionButton(
         child: Text('button'),
          onPressed: (){

      },
        ),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(image: _buildBackgroundImage()),
      ) ,
    );
  }


}