import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      darkTheme:ThemeData.dark(),

      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



 TextEditingController _nameController=TextEditingController();
var result;

   predictGender(String name) async{
     var url="https://api.genderize.io/?name=$name";
     var res= await http.get(url);
     var body=jsonDecode(res.body);
     result="gender :${body['gender']},probability:${body['probability']}";
     setState(() {
     });

   }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("gender prediction"),
      ),
     body: Padding(
       padding: const EdgeInsets.all(20.0),
       child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: <Widget>[
           Text("Predict your gender ?"),
           Padding(
             padding: const EdgeInsets.all(20.0),
             child: TextField(
               controller: _nameController,
              decoration: InputDecoration(
                hintText:"Your Name",
              ),
             ),
           ),
           RaisedButton(
             onPressed: () => predictGender(_nameController.text),
             child: Text("Predict") ,
             color: Colors.blue,
           ),
           if(result!=null) Text(result)
         ],
       ),
     ),
    );
  }
}

