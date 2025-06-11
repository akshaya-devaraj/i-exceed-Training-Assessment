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
  bool ch1=false;
  bool ch2=false;
  bool ch3=false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("CheckBoxListTile Demo"),
          toolbarHeight: 80.0,
          backgroundColor: Colors.purpleAccent,
        ),
        body: Column(
          children: [
            CheckboxListTile(value: ch1, onChanged: (value){
              setState(() {
                ch1=value!;
              });
            },activeColor: Colors.purple,title: Text("java"),subtitle: Text("Java master"),),
            CheckboxListTile(value: ch2, onChanged: (value){
              setState(() {
                ch2=value!;
              });
            },activeColor: Colors.purple,title: Text("Dart"),subtitle: Text("Dart master"),),
            CheckboxListTile(value: ch3, onChanged: (value){
              setState(() {
                ch3=value!;
              });
            },activeColor: Colors.purple,title: Text("Flutter"),subtitle: Text("Flutter master"),)
          ],
        ),
      ),

    );
  }
}



