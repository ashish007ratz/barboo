
import 'package:barboo/auth/login.dart';
import 'package:flutter/material.dart';
class Splash_Barbo extends StatefulWidget {
  @override
  _Splash_BarboState createState() => _Splash_BarboState();
}

class _Splash_BarboState extends State<Splash_Barbo> {
  bool Splash_Barbo = false;

  void initState() {
    super.initState();
    if (Splash_Barbo == false) {
      Future.delayed(Duration(seconds: 1), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child:
              Image(
                image: AssetImage('lib/assets/images/logo 1.png'),
                height: 300,
                width: 300,
              ),
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children:[
                Image(
                  image: AssetImage('lib/assets/images/Frame 2.png'),
                  height: 300,
                  width: 400,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
