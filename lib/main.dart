/// Flutter code sample for AppBar

// This sample shows an [AppBar] with two simple actions. The first action
// opens a [SnackBar], while the second action navigates to a new page.

import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
    home: new HomePage(),
));

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true;
    return Scaffold(
      appBar: new AppBar(
        title: Text('MyApp Demo'),
      ) ,
      body: Card(
        child: Container(
          child: Text('Test Demo'),
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}

class HomePage2 extends StatefulWidget{
  @override
  HomePage2Sate createState() => HomePage2Sate();
}

class HomePage2Sate extends State<HomePage2>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.forward),
        onPressed: (){
          setState(() {});
        }
      ),
      appBar: new AppBar(
        title: Text('MyApp Demo'),
      ) ,
      body: Row(children: <Widget>[
        Container(
          color: getColor(),
          width: 100.0,
          height: 100.0
        ),
        Container(
          margin: EdgeInsets.only(left: 10.0),
          color: getColor(),
          width: 100.0,
          height: 100.0
        ),
      ],),
    );
  }
  Color getColor() {
    return Color.fromARGB(
      255,
      Random().nextInt(255),
      Random().nextInt(255),
      Random().nextInt(255));
  }
}
