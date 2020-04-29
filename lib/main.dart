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
    return Scaffold(
      appBar: AppBar(
        title: Text("Sleep Tracker"),
      ),
      body: Container(
        child: Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image(
                  image: AssetImage('assets/moon.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0,0,20.0,20.0),
                child: Text("Get to know your baby's sleep patterns and keep\n"
                    "track of how much sleep they are getting here",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 16.0),
                ),
              ),
              RaisedButton(
                onPressed: (){},
                textColor: Colors.white,

                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF0D47A1),
                        Color(0xFF1976D2),
                        Color(0xFF42A5F5),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: const Text(
                      'Add new sleeping record',
                      style: TextStyle(fontSize: 20)
                  ),
                ),
              ),
              SizedBox(height: 100.0),

            ],
          ),
        ),
      ),
    );
  }

}