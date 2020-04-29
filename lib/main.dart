import 'package:flutter/material.dart';
import 'record.dart';
import 'item.dart';
import 'package:intl/intl.dart';

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

  String userType="";
  String userTime="";
  String timeOfDay="";
  List<String> types = new List<String>();
  List<String> times = new List<String>();
  List<String> timesOfDay = new List<String>();

  @override
  Widget build(BuildContext context) {

    var now = new DateTime.now();
    var formatter = new DateFormat('EEEE, dd MMM yyyy');
    String formatted = formatter.format(now);

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
                onPressed: () async{
                  Item item = new Item(userType, userTime,timeOfDay);
                  final result = await Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Record(item: item)));

                      setState(() {
                        item = result;
                        types.add(item.type);
                        times.add(item.time);
                        timesOfDay.add(item.timeOfDay);
                      });
                  },
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

              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "$formatted",
                    style: TextStyle(fontSize: 26, color: Colors.black),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: types.length,
                    itemBuilder: (BuildContext context,int index){
                      return Card(
                        child: ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.fromLTRB(0,10,0,0),
                            child: Text(
                              "${timesOfDay[index]}",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          title: Text("${types[index]}", style: TextStyle(fontSize: 16.0, color: Colors.blue[900]),),
                          subtitle: Text("${times[index]}", style: TextStyle(fontSize: 16.0, color: Colors.grey),),
                        ),
                      );
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}