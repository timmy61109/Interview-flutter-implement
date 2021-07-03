/// Flutter code sample for AppBar

// This sample shows an [AppBar] with two simple actions. The first action
// opens a [SnackBar], while the second action navigates to a new page.

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = '訂餐好好吃';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Image(image: AssetImage('assets/unnamed.png')),
        title: const Text('餐點'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
      ),
      body: ListView(
        children: const <Widget>[
          Card(
            child: ListTile(
                leading: const Image(image: NetworkImage('https://i.imgur.com/rOX17ph.jpeg')),
                title: Text('古意得好吃冰淇淋？'),
                subtitle: Text('新北市新莊區中和街175號'),
                trailing: Icon(Icons.navigate_next),
              ),
          ),
          Card(
            child: ListTile(
              leading: const Image(image: NetworkImage('https://doqvf81n9htmm.cloudfront.net/data/maggieyu_81/180320/0320014.jpg')),
              title: Text('派森家常小館'),
              subtitle: Text('台中市西屯區臺灣大道四段108巷24號'),
              trailing: Icon(Icons.navigate_next),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Image(image: NetworkImage('https://i.imgur.com/CUG0Aof.jpeg')),
              title: Text('值得你來漢堡'),
              subtitle: Text('新北市樹林區備內街46號'),
              trailing: Icon(Icons.navigate_next),
            ),
          ),
        ],
      ),
    );
  }
}
