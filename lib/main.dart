/// Flutter code sample for AppBar

// This sample shows an [AppBar] with two simple actions. The first action
// opens a [SnackBar], while the second action navigates to a new page.

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/rendering.dart';

void main() => runApp(MaterialApp(
    home: new GridViewHomePage(),
));

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = new TextEditingController();
    // debugPaintSizeEnabled = true;
    return Scaffold(
      appBar: new AppBar(
        title: Text('MyApp Demo'),
      ) ,
      body: TextField(
        controller: controller,
        onChanged: (text){
          print('onChanged');
          print(text);
        },
        onEditingComplete: (){
          print('onEditingComplate');
          print(controller.text);
        },
        // onSubmitted: (text){
          // print('onSubmitted');
          // print(text);
        // },
        decoration: new InputDecoration(
          icon: Icon(Icons.calendar_today),
          labelText: '日期',
          suffix: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              controller.text = '';
              FocusScope.of(context).requestFocus(new FocusNode());
            }
          ),
          suffixIcon: Icon(Icons.close),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.green
            )
          ),
          helperText: '輸入日期',
          hintText: '輸入日期',
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

class ListViewHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('MyApp Demo'),
      ) ,
      body: ListView(
        children: List.generate(
          10,
          (idx) {
            print('$idx');
            return Card(
              child: Container(
                height: 150,
                color: Colors.greenAccent,
                child: Text('$idx'),
              ),
            );
          }
        ),
      ),
    );
  }
}

class ListViewBuilderHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('MyApp Demo'),
      ) ,
      body: ListView.builder(
        itemBuilder: (context, idx) {
          print('$idx');
          return Card(
            child: Container(
              height: 150,
              color: Colors.yellowAccent,
              child: Text('$idx'),
            ),
          );
        }
      ),
    );
  }
}

class ImageNetworkHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = true;
    final String bannerImg = 'https://i.imgur.com/6Ybjgq2.jpg';
    return Scaffold(
      appBar: new AppBar(
        title: Text('MyApp Demo'),
      ) ,
      body: Image.network(
        bannerImg,
        height: 200.0,
        alignment: Alignment.bottomCenter,
        fit: BoxFit.cover,
      ),
    );
  }
}

class ImageAssetHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = true;
    final String bannerImg = 'assets/a198cb9d-9a8b-43c0-92af-e0b5ad4ac517.jpg';
    return Scaffold(
      appBar: new AppBar(
        title: Text('MyApp Demo'),
      ) ,
      body: Image.asset(
        bannerImg,
        height: 200.0,
        alignment: Alignment.bottomCenter,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

class GridViewHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = true;
    return Scaffold(
      appBar: new AppBar(
        title: Text('MyApp Demo'),
      ) ,
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        children: List.generate(
          100,
          (idx) {
            return Card(
              child: Container(
                child: Text('Index: $idx'),
                width: 500,
                height: 500,
                color: Colors.green,
              ),
            );
          }
        ),
      ),
    );
  }
}

class GridViewBuilderHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = true;
    return Scaffold(
      appBar: new AppBar(
        title: Text('MyApp Demo'),
      ) ,
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100,
          childAspectRatio: 2/3,
        ),
          itemBuilder: (context, idx) {
            return Card(
              child: Container(
                child: Text('Index: $idx'),
                width: 500,
                height: 500,
                color: Colors.green,
              ),
            );
          },
      ),
    );
  }
}
