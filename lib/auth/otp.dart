
import 'package:barboo/auth/login.dart';
import 'package:flutter/material.dart';
class OTP extends StatefulWidget {
  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  GlobalKey<FormState> form = GlobalKey<FormState>();
  void Validate() {
    form.currentState.validate();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Login()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SingleChildScrollView(
          child:Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 60.00),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage('lib/assets/images/logo 1.png'),
                    height: 200,
                    width: 200,
                  ),
                  Form(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.00),
                      child: Container(
                        height: 500,
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 7.00,
                                spreadRadius: 7.0,
                                offset: Offset(5,0),
                              )
                            ]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              child:
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 20, 0, 01),
                                child: Text(
                                  'OTP',
                                  style: TextStyle(
                                      fontSize: 40.0, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
                              child:
                              TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(0.0),  // icon is 48px widget.
                                  ),
                                  hintText: "enter OTP here",
                                  contentPadding: new EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                  border: OutlineInputBorder(borderRadius:BorderRadius.circular(20)),
                                  labelText: "OTP verification",
                                ),
                                validator:
                                    (value) {
                                  if (value.isEmpty) {

                                    return "please enter OTP";
                                  } else if(value!=1234) {
                                    return "enter valid OTP";
                                  }
                                  else{
                                    return null;
                                  }
                                },),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.black12)
                                  ),
                                  height: 50,
                                  minWidth: 300,
                                  color: Colors.black,
                                  onPressed: Validate,
                                  child:
                                  Text("Submit", style: TextStyle(color: Colors.white))),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                              TextButton(
                                child:
                                Text('Already a member Click here',style: TextStyle(color: Colors.black, fontWeight:FontWeight.w200),),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Login()));
                                },),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
