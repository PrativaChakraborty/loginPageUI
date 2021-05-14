import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  List<bool> states = [false, false];
  bool _visible = false;
  String x;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            height: kToolbarHeight,
            color: Color(0xff101010),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[800], width: 2),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Icon(
                        Icons.keyboard_arrow_left_outlined,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                ),
                Text(
                  "Sign Up",
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        backgroundColor: Color(0xff101010),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 18.0,
              right: 18.0,
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Sign up with one of the following options",
                      style: GoogleFonts.roboto(
                          color: Colors.grey[400], fontSize: 15),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildContainer(170, icon: FontAwesomeIcons.google),
                      buildContainer(170, icon: FontAwesomeIcons.apple),
                    ],
                  ),
                ),
                Form(
                  child: Column(
                    children: [
                      buildLabel("Name"),
                      textFieldContainer("Enter your name", TextInputType.name,
                          regex: r'^[a-zA-Z]+(\s[a-zA-Z]+\s)?$',
                          error: "Enter a valid name",
                          state: 0),
                      buildLabel("Email"),
                      textFieldContainer(
                          "example@gmail.com", TextInputType.emailAddress,
                          regex:
                              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
                          error: "Enter a valid email",
                          state: 1),
                      buildLabel("Password"),
                      textFieldContainer("Pick a strong password",
                          TextInputType.visiblePassword,
                          encrypt: true),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    decoration: boxDecoration.copyWith(
                      border: Border.all(width: 0),
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: [Color(0xffB716DB), Color(0xffD228A8)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                    ),
                    child: Text(
                      "Create Account",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Log In",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container textFieldContainer(String text, TextInputType inputType,
      {bool encrypt = false, String regex, String error, int state}) {
    return Container(
      // height: 60,
      // width: 500,
      // decoration: boxDecoration,
      child: TextFormField(
        autovalidateMode: encrypt
            ? AutovalidateMode.disabled
            : AutovalidateMode.onUserInteraction,
        initialValue: "",
        validator: (t) {
          if (!(RegExp(regex).hasMatch(t))) {
            // states[state] = false;

            return error;
          } else {
            // states[state] = true;
            return null;
            // return  _visible;
          }
        },
        onSaved: (s) {
          _visible = true;

          return _visible;
        },
        onChanged: (r) {
          // _formKey.currentState.validate();
        },
        obscureText: encrypt,
        keyboardType: inputType,
        style: TextStyle(color: Colors.white, fontSize: 18),
        cursorColor: Colors.grey,
        cursorHeight: 25,
        decoration: InputDecoration(
          hintText: text,
          contentPadding: EdgeInsets.only(
            left: 25,
            top: 20,
            bottom: 20,
          ),
          suffixIcon: Visibility(
            visible: _visible,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius: BorderRadius.circular(9)),
                child: Center(
                  child: Icon(
                    Icons.done,
                    color: Colors.grey[200],
                    size: 18,
                  ),
                ),
              ),
            ),
          ),
          hintStyle: TextStyle(color: Colors.grey[700], fontSize: 15),
        ),
      ),
    );
  }

  Row buildLabel(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    );
  }

  Container buildContainer(double width, {IconData icon}) {
    return Container(
      height: 60,
      width: width,
      decoration: boxDecoration,
      child: Center(
        child: FaIcon(
          icon,
          color: Colors.white,
          size: 25,
        ),
      ),
    );
  }
}

var boxDecoration = BoxDecoration(
    color: containerColor,
    border: Border.all(color: Colors.grey[900], width: 3),
    borderRadius: containerBorderRadius);

Color containerColor = Color(0xff171717);
BorderRadius containerBorderRadius = BorderRadius.circular(20);
