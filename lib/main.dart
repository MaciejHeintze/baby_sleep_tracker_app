import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: "Baby sleep tracker",
    home: App(),
  )
  );
}

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  MainState createState() => MainState();
}

class MainState extends State<App> {

  @override
  Widget build(BuildContext context) {
    return null;
  }

}