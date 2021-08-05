import 'package:flutter/material.dart';
import "package:graphql_flutter/graphql_flutter.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpLink httpLink = HttpLink('http://localhost:8000/graphql',);
  ValueNotifier<GraphQLClient> _client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(
        store: InMemoryStore(),
      ),
    ),
  );

  runApp(
    GraphQLProvider(
      client: _client,
      child: CacheProvider(child: MyApp()),
  ),);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Login Demo Asap',
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

// Used for controlling whether the user is loggin or creating an account
enum FormType {
  login,
  register
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailFilter = TextEditingController();
  final TextEditingController _usernameFilter = TextEditingController();
  final TextEditingController _passwordFilter = TextEditingController();
  static HttpLink httpLink = HttpLink('http://localhost:8000/graphql',);
  GraphQLClient _client = GraphQLClient(
    link: httpLink,
    cache: GraphQLCache(
      store: InMemoryStore(),
    ),
  );
  String _email = "";
  String _password = "";
  String _username = "";
  FormType _form = FormType.login; // our default setting is to login, and we should switch to creating an account when the user chooses to

  _LoginPageState() {
    _emailFilter.addListener(_emailListen);
    _usernameFilter.addListener(_usernameListen);
    _passwordFilter.addListener(_passwordListen);
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }

  void _usernameListen() {
    if (_usernameFilter.text.isEmpty) {
      _username = "";
    } else {
      _username = _usernameFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

  // Swap in between our two forms, registering and logging in
  void _formChange () async {
    setState(() {
      if (_form == FormType.register) {
        _form = FormType.login;
      } else {
        _form = FormType.register;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Simple Login ASAP"),
        centerTitle: true,
      ),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            _buildTextFields(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFields() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new TextField(
              controller: _emailFilter,
              decoration: InputDecoration(
                labelText: 'Email'
              ),
            ),
          ),
          Container(
            child: TextField(
              controller: _usernameFilter,
              decoration: InputDecoration(
                  labelText: 'Username'
              ),
            ),
          ),
          Container(
            child: TextField(
              controller: _passwordFilter,
              decoration: InputDecoration(
                labelText: 'Password'
              ),
              obscureText: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    if (_form == FormType.login) {
      return new Container(
        child: new Column(
          children: <Widget>[
            new ElevatedButton(
              child: new Text('Login'),
              onPressed: _loginPressed,
            ),
            new TextButton(
              child: new Text('Dont have an account? Tap here to register.'),
              onPressed: _formChange,
            ),
            new TextButton(
              child: new Text('Forgot Password?'),
              onPressed: _passwordReset,
            )
          ],
        ),
      );
    } else {
      return new Container(
        child: new Column(
          children: <Widget>[
            new ElevatedButton(
              child: new Text('Create an Account'),
              onPressed: _createAccountPressed,
            ),
            new TextButton(
              child: new Text('Have an account? Click here to login.'),
              onPressed: _formChange,
            )
          ],
        ),
      );
    }
  }

  // These functions can self contain any user auth logic required, they all have access to _email and _password

  void _loginPressed () {
    print('The user wants to login with $_email and $_password');
  }

  void _createAccountPressed () async {
    final String register = """
    mutation {
        register(
          email: "$_email",
          username: "$_username",
          password1: "$_password",
          password2: "$_password",
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
    // 之後要注回傳資料Map的結構，不然還是會同樣出錯
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
  }

  void _passwordReset () {
    print("The user wants a password reset request sent to $_email");
  }
}
