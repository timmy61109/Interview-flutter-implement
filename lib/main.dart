/// Flutter code sample for AppBar

// This sample shows an [AppBar] with two simple actions. The first action
// opens a [SnackBar], while the second action navigates to a new page.

import 'package:flutter/material.dart';
import "package:graphql_flutter/graphql_flutter.dart";

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
        return ForgotPasswordPage();
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
        title: Text('進階學習'),
      ),
      body: Column(
        children: <Widget> [
          Text('歡迎光臨'),
          Center(
            child: ElevatedButton(
              child: Text('Go Go Go!'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    }
                  )
                );
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
  final TextEditingController _usernameEmail = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登入"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Container(
              child: TextField(
                controller: _usernameEmail,
                decoration: InputDecoration(
                  labelText: 'Email or Username'
                ),
              ),
            ),
            Container(
              child: TextField(
                controller: _password,
                decoration: InputDecoration(
                  labelText: 'Password'
                ),
                obscureText: true,
              ),
            ),
            Text(''),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () {

              },
            ),
            TextButton(
              child: Text('Don\'t have an account? Tap here to register.'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) {
                          return RegisterPage();
                        }
                    )
                );
              },
            ),
            TextButton(
              child: Text('Forgot Password?'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) {
                          return ForgotPasswordPage();
                        }
                    )
                );
              },
            ),
          ],
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
  final TextEditingController _email = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _password2 = TextEditingController();
  static HttpLink httpLink = HttpLink('http://localhost:8000/graphql',);
  GraphQLClient _client = GraphQLClient(
    link: httpLink,
    cache: GraphQLCache(
      store: InMemoryStore(),
    ),
  );
  _RegisterPageState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('註冊'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Container(
              child: new TextField(
                controller: _email,
                decoration: InputDecoration(
                    labelText: 'Email'
                ),
              ),
            ),
            Container(
              child: TextField(
                controller: _username,
                decoration: InputDecoration(
                    labelText: 'Username'
                ),
              ),
            ),
            Container(
              child: TextField(
                controller: _password,
                decoration: InputDecoration(
                    labelText: 'Password'
                ),
                obscureText: true,
              ),
            ),
            Container(
              child: TextField(
                controller: _password2,
                decoration: InputDecoration(
                    labelText: 'Password again'
                ),
                obscureText: true,
              ),
            ),
            Text(''),
            ElevatedButton(
              child: new Text('Create an Account'),
              onPressed: () async {
                final String register = """
                  mutation {
                      register(
                        email: "$_email",
                        username: "$_username",
                        password1: "$_password",
                        password2: "$_password2",
                      ) {
                        success,
                        errors,
                        token,
                        refreshToken
                      }
                    }
                  """;
                MutationOptions options = MutationOptions(
                  document: gql(register),
                );
                final QueryResult result = await _client.mutate(options);
                // 之後要注回傳字典的結構，不然還是會同樣出錯
                if (result.data!["register"]["success"] == true) {
                  print('The user was created successfully!');
                  print('The user wants to create an accoutn with \nUsername: $_username\nEmail: $_email\nPassword: $_password');
                  print('狀態： ${result.data!["register"]["register"]}');
                  print('權杖： ${result.data!["register"]["token"]}');
                  print('更新權杖： ${result.data!["register"]["refreshToken"]}\n');

                } else {
                  print('There was an error!');
                  print('狀態： ${result.data!["register"]["register"]}');
                  print('錯誤訊息： ${result.data!["register"]["errors"]["email"][0]["message"]}\n');
                }
              },
            ),
            TextButton(
              child: new Text('Have an account? Click here to login.'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();
                        }
                    )
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ForgotPasswordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('密碼'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Container(
              child: new TextField(
                controller: _email,
                decoration: InputDecoration(
                    labelText: 'Email'
                ),
              ),
            ),
            Text(''),
            ElevatedButton(
              child: new Text('Send'),
              onPressed: () {

              },
            ),
          ],
        ),
      ),
    );
  }
}
