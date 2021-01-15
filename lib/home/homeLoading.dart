import 'package:flutter/material.dart';

class Home_Service extends StatelessWidget {
  final Color color;

  Home_Service(this.color);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10.0),
        color: Colors.black,
        height: 200,
        child: ClipRect(
          child: Banner(
            message: "hello",
            location: BannerLocation.topEnd,
            color: Colors.red,
            child: Container(
              color: Colors.yellow,
              height: 200,
              child: Center(
                child:Image.asset("lib/assets/images/service.png"),
              ),
            ),
          ),
        ),
      )
    );
  }
}