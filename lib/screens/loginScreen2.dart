import 'package:flutter/material.dart';


class LoginScreen2 extends StatelessWidget {

  static const String routeName = '/loginScreen2';
  final TextEditingController _passwordController = TextEditingController();


  DecorationImage _buildBackgroundImage() { //background image for login screeen
    return DecorationImage(

        fit: BoxFit.cover,
        colorFilter:
        ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
        image: AssetImage('assets/background.jpg'));
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Email', filled: true, fillColor: Colors.white),
      keyboardType: TextInputType.emailAddress,
      maxLines: 1,
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")

                .hasMatch(value)) {
          return 'email should not be empty and valid';
        }
      },
      onSaved: (String value) {

      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: 'Password',
      ),
      obscureText: true, //hides password
      keyboardType: TextInputType.text,
      controller: _passwordController,
      maxLines: 1,
      validator: (String value) {
        if (value.isEmpty || value.length < 6) {
          return 'password should not be empty and valid';
        }
      },
      onSaved: (String value) {

      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(image: _buildBackgroundImage(),),
        alignment: Alignment.center,
        child: Center(
          child: SingleChildScrollView(
            child:  Column(

              children: <Widget>[

                _buildEmailTextField(),
                SizedBox(height: 10,),
                _buildPasswordTextField(),
                SizedBox(height: 10,),

                RaisedButton(
                color: Colors.white,
                textColor: Colors.black,
                child: Text('LOGIN'),
                onPressed: () {
                  //navigate to homescreen

                }),

              ],
            ),
          ),
        )

      ),
    );
  }

}