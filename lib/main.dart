import 'package:flutter/material.dart';
import 'package:gradient_input_border/gradient_input_border.dart';
import 'package:login_ui/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          inputDecorationTheme: InputDecorationTheme(
            fillColor: containerColor,
            filled: true,
            border: GradientOutlineInputBorder(
              borderSide: BorderSide(width: 10),
              borderRadius: BorderRadius.circular(20),
              focusedGradient: LinearGradient(
                  colors: [Color(0xffB716DB), Color(0xffD228A8)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),
              unfocusedGradient:
                  LinearGradient(colors: [Colors.grey[900], Colors.grey[900]]),
            ),
          )),
      home: HomePage(),
    );
  }
}
