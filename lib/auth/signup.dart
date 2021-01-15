import 'package:barboo/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getflutter/getwidget.dart';
class Signup extends StatefulWidget {
  final Map<String, Map<String, String>> localizedValues;
  final String locale;

  Signup({Key key, this.locale, this.localizedValues});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController firstController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLoading = false,
      registerationLoading = false,
      rememberMe = false,
      value = false,
      passwordVisible = true;
  String email, password, name;

  bool _obscureText = true;

// Toggles the password
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  bool validate() {
    final form = _formKey.currentState;
    form.save();
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: height / 15),
            Container(
              child: SizedBox(
                height: height / 5,
                child: Image(
                    image: AssetImage('lib/assets/images/logo 1.png'),
                    fit: BoxFit.fitHeight),
              ),

            ),
            SizedBox(
              height: height / 30,
            ),
            SizedBox(height: 10),
            buildLoginPageForm(),
          ],
        ),
      ),
    );
  }

  Widget buildLoginPageForm() {
    double height = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: Theme(
        data: ThemeData(
          brightness: Brightness.light,
        ),
        child: Container(
          height: height/1.355,
          decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  blurRadius: 5.00,
                  spreadRadius: 2.0,
                  offset: Offset(4,0),
                )
              ]
          ),
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child:
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 0, 01),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 40.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: height / 25,
              ),
              buildEmailTextField(),
              // SizedBox(
              //   height: height / 30,
              // ),
              SizedBox(
                height: height / 30,
              ),
              buildFirstTextField(),
              SizedBox(
                height: height / 30,
              ),
              buildPasswordTextField(),
              SizedBox(
                height: height / 30,
              ),
              buildsignuplink(),
              SizedBox(
                height: height / 30,
              ),
              buildLoginButton(),
              SizedBox(
                height: height / 30,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 15, 0, 0),
                child:
                TextButton(
                  child:
                  Row(
                    children: [
                      Text('Already a member',style: TextStyle(color: Colors.black, fontWeight:FontWeight.w200),),
                      Text(' Sign In',style: TextStyle(color: Colors.blue, fontWeight:FontWeight.w200),),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>Login()));
                  },),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSignUpText() {
    return Text(
      "Register",
    );
  }

  Widget buildFirstText() {
    return GFTypography(
      showDivider: false,
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(text: "Enter Name"),
          ],
        ),
      ),
    );
  }
  Widget buildFirstTextField() {
    return Container(
      child: TextFormField(
        controller: firstController,
        keyboardType: TextInputType.text,
        validator: (String value) {
          if (value.isEmpty) {
            return "Enter Full Name";
          } else
            return null;
        },
        onSaved: (String value) {
          name = value;
        },
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.all(0.0),
            child: Icon(
              Icons.lock,
              color: Colors.black,
            ), // icon is 48px widget.
          ),
          hintText: "Name",
          contentPadding:
          new EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20)),
          labelText: "Name",
        ),
        obscureText: _obscureText,
      ),
    );
  }

  Widget buildEmailText() {
    return Padding(
      padding: const EdgeInsets.only(),
      child: GFTypography(
        showDivider: false,
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(text: "Email"),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildEmailTextField() {
    return Container(
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
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (String value) {
          if (value.isEmpty) {
            return "Enter your email";
          } else if (!RegExp(
              r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
              .hasMatch(value)) {
            return "Please enter valid email";
          } else
            return null;
        },
        onSaved: (String value) {
          email = value;
        },
//         decoration: InputDecoration(
// errorBorder: OutlineInputBorder(
// borderSide: BorderSide(width: 0, color: Color(0xFFF44242))),
//           errorStyle: TextStyle(color: Colors.black54),
//           suffixIcon: Icon(Icons.email_outlined, color: Colors.blue, size: 20),
// contentPadding: EdgeInsets.all(10),
// enabledBorder: const OutlineInputBorder(
// borderSide: const BorderSide(color: Colors.grey, width: 0.0),
// ),
// focusedBorder: OutlineInputBorder(
// borderSide: BorderSide(color: Colors.black,
// ),
//         ),
//       ),

      )  );
  }

  // Widget buildConfrmPasswordText() {
  //   return GFTypography(
  //     showDivider: false,
  //     child: RichText(
  //       text: TextSpan(
  //         children: <TextSpan>[
  //           TextSpan(text: "Confirm Password", ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  // Widget buildConfrmPassTextField() {
  //   return Container(
  //     child: TextFormField(
  //       controller: confirmPasswordController,
  //       keyboardType: TextInputType.text,
  //       validator: (String value) {
  //         if (value.isEmpty) {
  //           return "Enter Password";
  //         } else if (value.length < 6) {
  //           return "Please Enter Min 6 Digit Password";
  //         } else
  //           return null;
  //       },
  //       onSaved: (String value) {
  //         password = value;
  //       },
  //       decoration: InputDecoration(
  //         errorStyle: TextStyle(color: Colors.black54),
  //         suffixIcon: InkWell(
  //           onTap: _toggle,
  //           child: _obscureText
  //               ? Icon(Icons.remove_red_eye, color: Colors.blue, size: 20)
  //               : Icon(Icons.remove_red_eye, color: Colors.black12, size: 20),
  //         ),
  //       ),
  //       obscureText: _obscureText,
  //     ),
  //   );
  // }

  Widget buildPasswordText() {
    return GFTypography(
      showDivider: false,
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(text: "Password", ),
          ],
        ),
      ),
    );
  }
  Widget buildPasswordTextField() {
    return Container(
      child: TextFormField(
        controller: passwordController,
        keyboardType: TextInputType.text,
        validator: (String value) {
          if (value.isEmpty) {
            return "Enter Password";
          } else if (value.length < 6) {
            return "Please Enter Min 6 Digit Password";
          } else
            return null;
        },
        onSaved: (String value) {
          password = value;
        },
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
        obscureText: _obscureText,
      ),
    );
  }


  Widget buildsignuplink() {
    return FlatButton(
      color:Colors.black,
      height: 50,
      minWidth: 400,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.black12)
      ),
      onPressed: () async {
        if (_formKey.currentState.validate()) {
          FirebaseAuth.instance
              .createUserWithEmailAndPassword(
              email: emailController.text.toString().trim(),
              password: passwordController.text.toString().trim())
              .then((currentUser) => FirebaseFirestore.instance
              .collection("users")
              .doc(currentUser.user.uid)
              .set({
            "uid": currentUser.user.uid,
            "name": firstController.text,
            "email": emailController.text,
          })
              .then((result) => {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => Login()),
                    (_) => false),
            firstController.clear(),
            emailController.clear(),
            passwordController.clear(),
            // confirmPasswordController.clear()
          })
              .catchError((err) => print(err)))
              .catchError((err) => print(err));
        } else{
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Error"),
                  content: Text("please enter proper values"),
                  actions: <Widget>[
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black12)
                      ),
                      child: Text("Close"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              });
        }
      },
      child: Stack(
        children: <Widget>[
          registerationLoading
              ? GFLoader(
            type: GFLoaderType.ios,
          )
              :
          Text('Sign Up', style: TextStyle(color: Colors.white))
        ],
      ),
    );
  }

  Widget buildLoginButton() {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),),
          );
        },
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "have got an account" + "? ",
              ),
              TextSpan(
                text: "login",
              ),
            ],
          ),
        ));
  }

// Widget buildcontinuetext() {
// return Text(
// "or",
// textAlign: TextAlign.center,
// style: textBarlowRegularBlack(),
// );
// }
//
// Widget buildsocialbuttons() {
// return Row(
// children: <Widget>[
// Expanded(
// child: Padding(
// padding: const EdgeInsets.only(top: 10.0, left: 0.0, right: 0.0),
// child: GFButton(
// size: GFSize.LARGE,
// icon: Icon(
// IconData(
// 0xe906,
// fontFamily: 'icomoon',
// ),
// color: Colors.white,
// size: 28,
// ),
// buttonBoxShadow: true,
// color: Color(0xFF3B5998),
// onPressed: () {},
// child: Text(
// "Sign Up with Facebook",
// style: textBarlowRegularrWhite(),
// ),
// ),
// ),
// ),
// SizedBox(
// height: 10,
// ),
// ],
// );
// }

  void showSnackbar(message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 3000),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}