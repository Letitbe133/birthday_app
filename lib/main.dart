import 'package:birthaday_app/screens/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'I\'m not 40 !',
      home: Home(title: 'Birthday App'),
    );
  }
}

// Built with <3 and for fun
