import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() 
{
  runApp(MyTechApp());
}

web(osname,imagename) async {
  var url = "http://192.168.56.107/cgi-bin/web.py?x=${osname}&y=${imagename}";
  var response = await http.get(url);
  print(response.body);
}

class MyTechApp extends StatelessWidget {
  String cmd;
  String imagename;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title : Text('Tech App'),
          ),
        body: Center(
          child: Container(
            width: 300,
            height: 300,
            color: Colors.grey.shade300,
            child: Column(
              children: <Widget>[
              TextField(
                 onChanged: (value) {
                   cmd = value;
                 },
                autocorrect:  false,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter ur docker name",
                  prefixIcon: Icon(Icons.tablet_android),
                 ),
                ),
                TextField(
                  onChanged: (value) {
                    imagename = value;
                  },
                autocorrect: false,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter ur Docker OS name",
                  prefixIcon: Icon(Icons.tablet_android),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    web(cmd,imagename);
                  },
                  child: Text('click here')),
              ],
            ),
          ), 
        ),
      ),
    );
  }
}
