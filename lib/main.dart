/// Flutter code sample for AppBar

// This sample shows an [AppBar] with two simple actions. The first action
// opens a [SnackBar], while the second action navigates to a new page.

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'SqliteHelper.dart';
import 'api_test.dart';
import "package:graphql_flutter/graphql_flutter.dart";
import 'package:graphql/client.dart';


void main() => runApp(
  MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) {
        return GraphQLProviderLoginPage(
          client: graphQLConfiguration.client,
          child: CacheProvider(
            child: LoginPage()
          ),
        );
      },
      '/page2': (context) {return Page2(textData: 'abcd');},
    },
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

class ButtomNavigationBarHomePage extends StatefulWidget{
  @override
  _ButtomNavigationBarHomePageState createState() => _ButtomNavigationBarHomePageState();
}

class _ButtomNavigationBarHomePageState extends State<ButtomNavigationBarHomePage>{
  int index = 0;
  List<Widget> pages = [
    Container(color: Colors.red),
    Container(color: Colors.blue),
    Container(color: Colors.green),
    Container(color: Colors.orange),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('MyApp Demo'),
      ) ,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (int idx) {
          setState(
            () {
              index = idx;
            }
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              color: Colors.black87,
            ),
            label: 'Add'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: Colors.black87,
            ),
            label: 'Account'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.close,
              color: Colors.black87,
            ),
            label: 'Close'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.build,
              color: Colors.black87,
            ),
            label: 'Build'
          ),
        ]
      ),
      body: pages[index],
    );
  }
}

class NavigatorHomePageState extends StatefulWidget {
  @override
  _NavigatorHomePageState createState() => _NavigatorHomePageState();
}

class _NavigatorHomePageState extends State<NavigatorHomePageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page1'),
      ),
      body: Container(color: Colors.red,),
      floatingActionButton: FloatingActionButton(onPressed:() {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return Page2(textData: 'abcd');
            })
          ).then((value) {print(value);});
        },
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  final String textData;
  Page2({
    Key? key,
    required this.textData
  }): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page2'),
      ),
      body: SizedBox.expand(
        child: Container(
          child: Text(textData),
          color: Colors.green,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, 'qqqqqqqqqq');
        },
      ),
    );
  }
}

class HttpHomePage extends StatefulWidget {
  @override
  _HttpHomePage createState() => _HttpHomePage();
}

class _HttpHomePage extends State<HttpHomePage> {
  final String host = 'https://jsonplaceholder.typicode.com/posts';
  List datas = [];
  @override
  void initState() {
    super.initState();
  }
  // 取得網站內容 方式 1
  // getData() async {
  //   var response = await http.get(Uri.parse(host));
  //   print(response.body);
  // }

  // 取得網站內容 方式 2
  // getData() {
  //   http.get(Uri.parse(host)).then(
  //     (response) {
  //       print(response.body);
  //     }
  //   );
  // }

  // 取得Json格式資料
  getData() {
    http.get(Uri.parse(host)).then(
      (response) {
        setState(
          () {
            datas = jsonDecode(response.body);
          }
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Http+FutureBuider'),
      ),
      body: ListView.builder(
        itemCount: datas.length,
        itemBuilder: (context, idx){
          var data = datas[idx];
          return ListTile(
            title: Text(data['title']),
            subtitle: Text(data['body']),
          );
        },
      )
    );
  }
}

// 目前這麼方法無法解決
class FutureBuilderHomePage extends StatefulWidget {
  @override
  _FutureBuilderHomePage createState() => _FutureBuilderHomePage();
}

class _FutureBuilderHomePage extends State<FutureBuilderHomePage> {
  final String host = 'https://jsonplaceholder.typicode.com/posts';
  @override
  void initState() {
    super.initState();
  }
  // 取得網站內容 方式 1
  // getData() async {
  //   var response = await http.get(Uri.parse(host));
  //   print(response.body);
  // }

  // 取得網站內容 方式 2
  getData() {
    http.get(Uri.parse(host));
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Http+FutureBuider'),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snap) {

          if (!snap.hasData) {
            return Container();
          }
          data = snap;
          List datas = jsonDecode(data.body);
          return ListView.builder(
            itemCount: datas.length,
            itemBuilder: (context, idx){
              var data = datas[idx];
              return ListTile(
                title: Text(data['title']),
                subtitle: Text(data['body']),
              );
            },
          );
        }
      )
    );
  }
}

class SqliteHomePage extends StatefulWidget {
  @override
  _SqliteHomePage createState() => _SqliteHomePage();
}

class _SqliteHomePage extends State<SqliteHomePage> {
  final String host = 'https://jsonplaceholder.typicode.com/posts';
  final sqlHelp = SqliteHelper();

  getAllPost() async {
    await sqlHelp.open();
    return await sqlHelp.queryAll();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.http),
        onPressed: () async {
          await sqlHelp.open();
          var response = await http.get(Uri.parse(host));
          List l = jsonDecode(response.body);
          l.forEach((e) async => sqlHelp.insert(e)
        );
        setState(() {});
        },
      ),
      appBar: AppBar(
        title: Text('SQLite in Flutter'),
      ),
      body: FutureBuilder(
        future: getAllPost(),
        builder: (context, snap) {
          print(snap);
          if (snap.hasData) {
            List l = snap.data;
            return ListView.builder(
              itemCount: l.length,
              itemBuilder: (context, idx) {
                return ListTile(title: Text(l[idx]['title']),);
              },
            );
          }
          return Container();
        }
      )
    );
  }
}
