import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tracking my Run',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        //visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('You have pressed the button $_count times.')),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue[100],
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              _count = _count + 1;
            });
          }),
    );
  }
}
