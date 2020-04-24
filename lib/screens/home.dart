import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:birthaday_app/screens/people.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.red[400],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              child: Column(
               children: <Widget>[
                 Text(
                   "I'm not 40 !",
                   style: TextStyle(
                       fontSize: 60.0,
                        fontWeight: FontWeight.bold,
                   ),
                 ),
                 SizedBox(
                   height: 10.0,
                 ),
                 Text(
                   "I'm 18 with 22 years of experience",
                   style: TextStyle(fontSize: 22.0),
                 ),

               ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.cake),
              iconSize: 100.0,
              color: Colors.red[400],
              enableFeedback: true,
              padding: EdgeInsets.all(20.0),
              onPressed: () {
                //print("Hello");
                Navigator.of(context).push(MaterialPageRoute(
                    builder:  (context) => People()
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
