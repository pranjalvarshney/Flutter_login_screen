import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  bool newUser = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ClipPath(
                clipper: Myclipper1(),
                child: Container(
                  height: (0.35) * height,
                  color: Colors.deepPurple,
                  child: Center(
                    child: Container(
                        child: Text(
                      "Company Name",
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                  ),
                ),
              ),
              _loginSignupSection(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginSignupSection() => Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Container(
          padding: EdgeInsets.only(top: 40, bottom: 50),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 5.0)
              ]),
          child: Center(
              child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            newUser = false;
                          });
                        },
                        child: Container(
                            child: Text("Login",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            newUser = true;
                          });
                        },
                        child: Container(
                            alignment: Alignment.centerRight,
                            child: Text("New User!",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.red[300],
                                    fontWeight: FontWeight.w600))),
                      ),
                    ),
                  ],
                ),
                newUser == false ? _loginSection(): _signUpSection(),
                SizedBox(height: 20),
              ],
            ),
          )),
        ),
      );

  Widget _loginSection() => Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(height: 30),
              _inputUserName(),
              SizedBox(height: 10),
              _inputPassword(),
              SizedBox(height: 10),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(child: _forgotPassword()),
              Expanded(child: _loginBtn()),
            ],
          ),
        ],
      );

Widget _signUpSection() => Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(height: 30),
              _inputName(),
              SizedBox(height: 10),
              _inputUserName(),
              SizedBox(height: 10),
              _inputPhoneNo(),
              SizedBox(height: 10), 
              _inputPassword(),
              SizedBox(height: 10),
              
            ],
          ),
          Row(children: <Widget>[
            Expanded(child: _signUpBtn()),
            ],)
          
        ],
      );


  Widget _forgotPassword() => GestureDetector(
        child: Text(
          "Forgot Password?",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      );

    Widget _inputName() => TextFormField(
        decoration: InputDecoration(
            labelText: "Name",
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        keyboardType: TextInputType.text,
        validator: (val) {
          if (val == "") {
            return "Name not entered";
          } else {
            return null;
          }
        },
      );

      Widget _inputUserName() => TextFormField(
        decoration: InputDecoration(
            labelText: "Phone No.",
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        keyboardType: TextInputType.phone,
        validator: (val) {
          if (val == "") {
            return "Phone No. not entered";
          } else {
            return null;
          }
        },
      );


  Widget _inputPhoneNo() => TextFormField(
        decoration: InputDecoration(
            labelText: "Email",
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        keyboardType: TextInputType.emailAddress,
        validator: (val) {
          if (val == "") {
            return "Email not entered";
          } else {
            return null;
          }
        },
      );
  Widget _inputPassword() => TextFormField(
      decoration: InputDecoration(
          labelText: "Password",
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      keyboardType: TextInputType.text,
      validator: (val) {
        if (val == "") {
          return "Password not entered";
        } else {
          return null;
        }
      });
  Widget _loginBtn() => RaisedButton(
        onPressed: () {},
        color: Colors.deepPurpleAccent,
        textColor: Colors.white,
        child: Text(
          "Let's Go",
          style: TextStyle(fontSize: 18),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
  );
  Widget _signUpBtn() => RaisedButton(
    onPressed: () {},
    color: Colors.deepPurpleAccent,
    textColor: Colors.white,
    child: Text(
      "SignUp",
      style: TextStyle(fontSize: 18),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

class Myclipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    var c1 = new Offset(size.width / 8, 5 * (size.height / 8));
    var e1 = new Offset(size.width / 2, 3 * (size.height / 4));
    path.quadraticBezierTo(c1.dx, c1.dy, e1.dx, e1.dy);
    var c2 = new Offset(7 * (size.width / 8), 7 * (size.height / 8));
    var e2 = new Offset(size.width, (size.height / 2));
    path.quadraticBezierTo(c2.dx, c2.dy, e2.dx, e2.dy);

    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
