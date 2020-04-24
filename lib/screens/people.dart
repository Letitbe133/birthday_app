import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class People extends StatefulWidget {

  @override
  _PeopleState createState() => _PeopleState();

}

class _PeopleState extends State<People> {

  String _fact = "";
  bool _isLoading = false;
  final _endpoint = "https://cat-fact.herokuapp.com/facts";

  Future<String> getCatsData() async {
    setState(() {
      _isLoading = true;
    });
    var response = await http.get(_endpoint);
    var  data = jsonDecode(response.body);
    var length = data["all"].length;
    var index = Random().nextInt(length);
    var fact = data['all'][index]['text'];
    setState(() {
      _fact = fact;
      _isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Birthday App"),
        centerTitle: true,
        backgroundColor: Colors.red[400],
      ),
      body:  _isLoading ?
      Center(
        child: SpinKitPumpingHeart(
          color: Colors.red[400],
          duration: Duration(
            milliseconds: 800
          ),
          size: 50.0,
        ),
      )

       : ListView(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image(
                  height: 280.0,
                  image: AssetImage('assets/images/bad_cat.jpeg'),
                ),
                Text(
                    "Did You Know ?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 20.0
                  ),
                  child: Center(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0)
                      ),
                      focusElevation: 0.0,
                      child: Text("Click for new fun fact !",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0
                        ),
                      ),
              color: Colors.red[400],
              splashColor: Colors.red[200],
              onPressed: () {
                    getCatsData();
                      }
      ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: 20.0
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 10.0
                  ),
                  child: Text(
                    _fact,
                    style: TextStyle(
                      fontSize: 18.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                )
              ],
            ),
    );
  }
}