import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_application/asset_image.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _value=1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          backgroundColor: Colors.indigo,
          title: Text("RadioListTile Widget"),
        ),
        body: ListView(
          children: [
            RadioListTile(value: 1, groupValue: _value, onChanged: (val){
              setState(() {
                _value=val!;
              });
            },title: Text("Dart"),subtitle: Text("courses"),),SizedBox(width:  10,),
            RadioListTile(value: 2, groupValue: _value, onChanged: (val){
              setState(() {
                _value=val!;
              });
            },title: Text("Java"),subtitle: Text("courses"),),SizedBox(width: 10,)
          ],
        ),
      ),
    );
  }
}
