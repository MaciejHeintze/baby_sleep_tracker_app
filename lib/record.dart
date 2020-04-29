import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'item.dart';

class Record extends StatefulWidget{
  final Item item;
  Record({Key key, this.item}) : super(key: key);

  @override
  RecordState createState() => RecordState();
}

class RecordState extends State<Record>{

  String dropdownValue = 'Nap';
  var hours = 0;
  var minutes = 0;
  int index = 0;

  void _showDialogHours() {
    showDialog<dynamic>(
        context: context,
        builder: (BuildContext context) {
          return new NumberPickerDialog.integer(
            minValue: 0,
            maxValue: 24,
            title: new Text("Pick sleeping hours"),
            initialIntegerValue: hours,
          );
        }
    ).then((var value) {
      if (value != null) {
        setState(() => hours = value);
        _showDialogMinutes();
      }
    });
  }

  void _showDialogMinutes() {
    showDialog<dynamic>(
        context: context,
        builder: (BuildContext context) {
          return new NumberPickerDialog.integer(
            minValue: 0,
            maxValue: 59,
            title: new Text("Pick sleeping minutes"),
            initialIntegerValue: hours,
          );
        }
    ).then((var value) {
      if (value != null) {
        setState(() => minutes = value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    var now = new DateTime.now();
    var formatter = new DateFormat('dd MMMM yyyy, H:mm');
    var formatterHours = new DateFormat('H:m');
    String formatted = formatter.format(now);
    String formattedHours = formatterHours.format(now);
    String sleepDuration;

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
                    '$formatted',
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
                  FlatButton(
                    onPressed: (){
                      _showDialogHours();
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '$hours hours, $minutes minutes',
                        style: TextStyle(fontSize: 12.0),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),

                  SizedBox(
                    width: double.infinity,

                    child: RaisedButton(
                      onPressed: () {
                        sleepDuration =  '$hours hours, $minutes minutes';

                        Item item1= new Item(dropdownValue, sleepDuration, formattedHours);

                        Navigator.pop(context, item1);

                      },
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      color: Colors.blue,

                      child: Text(
                          'Save',
                          style: TextStyle(fontSize: 20)
                      ),
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