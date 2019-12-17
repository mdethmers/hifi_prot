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
      appBar: AppBar(
        title: Text('asssistant'),
      ),
      body: Container(
        decoration: BoxDecoration(image: _buildBackgroundImage()),
      ) ,
    );
  }


}