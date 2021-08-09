/// Flutter code sample for AppBar

// This sample shows an [AppBar] with two simple actions. The first action
// opens a [SnackBar], while the second action navigates to a new page.

import 'package:flutter/material.dart';

enum FormType {
  login,
  register,
  reset_password
}

void main() => runApp(
  MaterialApp(
    routes: {
      '/': (context) {
        return MyApp();
      },
      '/login': (context) {
        return LoginPage();
      },
      '/register': (context) {
        return RegisterPage();
      },
      '/reset_password': (context) {
        return ResetPasswordPage();
      }
    },
  )
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('晨知作品'),
      ),
      body: Column(
        children: <Widget> [
          Text('歡迎光臨'),
          Center(
            child: ElevatedButton(
              child: Text('Go Go Go!'),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          )
        ]
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

    );
  }
}

class ResetPasswordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

    );
  }
}
