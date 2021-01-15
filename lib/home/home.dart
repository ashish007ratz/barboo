import 'package:barboo/auth/otp.dart';
import 'package:barboo/home/homeLoading.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  const Home({Key key,
    @required this.user})
      :super(key: key);
  final FirebaseUser user;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    OTP(),
    Home_Service(Colors.deepOrange),
    Home_Service(Colors.green),
    Home_Service(Colors.grey)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Flutter App'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.blue,
        selectedItemColor: Colors.black,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        // this will be set when a new tab is tapped
        items: [
         new BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('____'),
          ),
         new BottomNavigationBarItem(
            icon: new Icon(Icons.search),
            title: new Text('____'),
          ),
         new BottomNavigationBarItem(
              icon: Icon(Icons.notification_important_rounded),
              title: Text('____')
          ),
         new BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('____')
          ),
        ],
      ),
    );
  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
