import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

dockerApp(){
  
  String osName;
  String imageName;
  String delete;

  docker() async{
  var url = "http://192.168.43.44/cgi-bin/docker.py";
  var r = await http.get(url);
  var data = r.body;
  print(data);
  }

  web(osName, imageName,) async{
  var url = "http://192.168.43.44/cgi-bin/web.py?x=${osName}&y=${imageName}";
  var r = await http.get(url);
  var data = r.body;
  print(data);
  }

  dockerRM(delete) async{
  var url = "http://192.168.43.44/cgi-bin/docker_rm.py?z=${delete}";
  var r = await http.get(url);
  var data = r.body;
  print(data);
  }
  
  var mybody = Container(
    width: double.infinity,
    height: double.infinity,
    color: Colors.red.shade300,
    // margin: EdgeInsets.all(20),
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        RaisedButton(
          onPressed: (){
            docker();
          },
          splashColor: Colors.black,
          color: Colors.blue,
          child: Card(
            child: Text('Click to steup Docker', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          ),
        ),
        Card(child: TextField(
          autocorrect: false,
          textAlign: TextAlign.center,
          style: TextStyle(height: 1),
          cursorColor: Colors.black,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(3),),
            prefixIcon: Icon(Icons.send),
            hintText: 'Enter your OS name'
          ),
          onChanged: (value){
            osName = value;
          },
        ),
        ),
        Card(child: TextField(
          autocorrect: false,
          textAlign: TextAlign.center,
          style: TextStyle(height: 1),
          cursorColor: Colors.black,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(3),),
            prefixIcon: Icon(Icons.send),
            hintText: 'Enter your Image name'
          ),
          onChanged: (value){
            imageName = value;
          },
        ),
        ),
        FlatButton(
          onPressed: (){
            web(osName, imageName);
          },
          splashColor: Colors.black,
          color: Colors.blue,
          child: Card(
            child: Text('Summit', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
          ),
        ),
        Column(
          children: [
            Card(child: TextField(
              autocorrect: false,
              textAlign: TextAlign.center,
              style: TextStyle(height: 1),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(3),),
                prefixIcon: Icon(Icons.send),
                hintText: 'OS name you want to delete'
              ),
              onChanged: (value){
                delete = value;
              },
            ),
            ),
            FlatButton(
          onPressed: (){
            dockerRM(delete);
          },
          splashColor: Colors.black,
          color: Colors.blue,
          child: Card(
            child: Text('Summit', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
          ),
        ),
          ],
        ), 
      ],
    ),
  );
  
  return MaterialApp(home: Scaffold(
    appBar: AppBar(
      title: Text('Docker App')
    ),
    body: mybody,
  ),
  debugShowCheckedModeBanner: false,
  );
}