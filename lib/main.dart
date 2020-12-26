import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter I phone UI',
        theme: ThemeData(
            textTheme: TextTheme(
                    bodyText1: TextStyle(),
                    bodyText2: TextStyle(),
                    headline4: TextStyle())
                .apply(bodyColor: Colors.white, displayColor: Colors.blue),
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Roboto'),
        home: Home());
  }
}
