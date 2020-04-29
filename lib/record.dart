import 'package:babysleeptrackerapp/main.dart';
import 'package:flutter/material.dart';

class Record extends StatefulWidget{
  Record({Key key}) : super(key: key);

  @override
  RecordState createState() => RecordState();
}

class RecordState extends State<Record>{

  String dropdownValue = 'Nap';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sleep Tracker"),
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0,0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Image(
                    image: AssetImage('assets/baby.jpg'),
                    height: 200,
                    width: 400,
                  ),

                  SizedBox(height: 20.0),

                  Text(
                    'Date and time',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'datetime',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 22.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 30.0,
                  ),
                  Text(
                    'Sleep type',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  DropdownButton<String>(
                    value: dropdownValue,
                    underline: Container(
                      height: 4,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['Nap', 'Nights sleep','Day']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),

                  Divider(
                    color: Colors.grey,
                    height: 30.0,
                  ),

                  Text(
                    'Sleep duration',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],
              ),
          ),
        ),
      ),
    );
  }

}