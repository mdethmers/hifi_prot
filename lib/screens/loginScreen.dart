import 'package:flutter/material.dart';
import 'package:hifi_prot/screens/loginScreen2.dart';

class loginScreen extends StatelessWidget {


  DecorationImage _buildBackgroundImage() { //background image for login screeen
    return DecorationImage(

        fit: BoxFit.cover,
        colorFilter:
        ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
        image: AssetImage('assets/background.jpg'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(image: _buildBackgroundImage()),
        child: Container(child: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height*0.85,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.15,
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              color: Colors.white,
              child:
                  Container(
                    decoration: BoxDecoration(border: Border.all(width: 2)),
                    child: RaisedButton(

                      color: Colors.white,
                      child: Text('LOGIN'),
                      onPressed: (){
                        Navigator.pushReplacementNamed(context, LoginScreen2.routeName);
                      },


                    ),
                  )

            ),
          ],
        ),
        ),
      ) ,
    );
  }


}