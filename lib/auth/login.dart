import 'package:barboo/auth/signup.dart';
import 'package:barboo/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email, _password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /* void Validate() {
    formKey.currentState.validate();
   Navigator.push(
  context,
        MaterialPageRoute(
           builder: (context) => Splash_Barbo()));
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.00),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage('lib/assets/images/logo 1.png'),
                  height: 200,
                  width: 200,
                ),
                Container(
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.00),
                      child: Container(
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
                                padding: const EdgeInsets.fromLTRB(15, 60, 0, 01),
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                      fontSize: 40.0, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Icon(
                                      Icons.email,
                                      color: Colors.black,
                                    ), // icon is 48px widget.
                                  ),
                                  hintText: "ash@gmail.com",
                                  contentPadding:
                                  new EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  labelText: "Email",
                                ),
                                onSaved: (input) => _email = input,
                                validator: (input) {
                                  if (input.isEmpty) {
                                    return "please enter valid email";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Icon(
                                      Icons.lock,
                                      color: Colors.black,
                                    ), // icon is 48px widget.
                                  ),
                                  hintText: "*******",
                                  contentPadding:
                                  new EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  labelText: "Password",
                                ),
                                onSaved: (input) => _password = input,
                                obscureText: true,
                                validator: (input) {
                                  if (input.isEmpty) {
                                    return "enter password";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
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
                                  onPressed: signIn,
                                  child:
                                  Text("login ", style: TextStyle(color: Colors.white))),
                            ),
                            Container(
                              child:
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 5, 0, 01),
                                child: Text(
                                  'or',
                                  style: TextStyle(
                                      fontSize: 25.0, fontWeight: FontWeight.w100),
                                ),
                              ),
                            ),
                            Container(
                              child:Row(
                                children:[
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(45, 15, 0, 0),
                                    child: FlatButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.black12),
                                      ),
                                      height: 50,
                                      minWidth: 140,
                                      onPressed: signIn,
                                      child: Row(
                                          children:[
                                            Icon(IconData(0xf1a0,fontFamily:'Google'),color: Colors.black,size: 15,),

                                            Text("Google ", style: TextStyle(color: Colors.black54))]),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(25, 15, 0, 0),
                                    child: FlatButton(
                                      color: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                          side: BorderSide(color: Colors.black12)
                                      ),
                                      height: 50,
                                      minWidth: 140,
                                      onPressed: signIn,
                                      child:Row(
                                        children:[
                                          Icon(IconData(0xf09a,fontFamily:'MyFlutterApp')),
                                          Text("Facebook ", style:
                                          TextStyle(color: Colors.black54))],),),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(100, 15, 0, 0),
                              child:
                              TextButton(
                                child:
                                Row(
                                  children: [
                                    Text('Noy yet member',style: TextStyle(color: Colors.black, fontWeight:FontWeight.w200),),
                                    Text(' click here',style: TextStyle(color: Colors.blue, fontWeight:FontWeight.w200),),
                                  ],
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Signup()));
                                },),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final formState = formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        UserCredential user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password)
            .then((value) {
          return Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
        });
      } catch (e) {
        print(e.message);
      }
    }
  }
}
