import 'package:flutter/material.dart';
import 'package:http/http.dart';

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
  TextEditingController _nameController= TextEditingController();
  var result;

  genderpreidct(String name){
   var url="https://api.genderize.io/?name=$name";


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
             onPressed: _nameController.text.length>0 ? () {} : null,
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

