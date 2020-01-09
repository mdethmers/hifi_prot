import 'package:flutter/material.dart';
import 'package:hifi_prot/screens/homeScreen.dart';


class LoginScreen2 extends StatefulWidget {

  static const String routeName = '/loginScreen2';
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginScreen2();
  }
}

class _LoginScreen2 extends State<LoginScreen2> {



  final TextEditingController _passwordController = TextEditingController();
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _loginData = {
    'email': null,
  };


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
          labelText: 'Student Number', filled: true, fillColor: Colors.white),
      keyboardType: TextInputType.emailAddress,
      maxLines: 1,
      validator: (String value) {
        if (value.isEmpty && value.substring(0,1) != 's') {
          return 'Student Number should not be empty and valid';
        }
      },
      onSaved: (String value) {
        _loginData['email'] = value;
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

    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Form(
        key: _formKey,
        child: Container(
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
                        if(_formKey.currentState.validate()) {
                          Navigator.pushReplacementNamed(context, homeScreen.routeName);
                        }
                      }),

                ],
              ),
            ),
          )

      )
        ,)
    );
  }

}