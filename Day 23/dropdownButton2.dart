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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: dropDemo());
  }
}

class dropDemo extends StatefulWidget {
  const dropDemo({super.key});

  @override
  State<dropDemo> createState() => _dropDemoState();
}

class _dropDemoState extends State<dropDemo> {

   _dropDemoState()

   {
    _selected = lang[0];
   }

   String _selected="";
  List<String> lang=[
    "Java","Dart","Flutter","Python","Javascript"
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DropDown Demo"),
        toolbarHeight: 80.0,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            DropdownButton(hint:Text("dropDown"),items: lang.map((e)=>
                DropdownMenuItem(
                  child: Text(e),value: e,),).toList(),
                onChanged: (value){
              setState(() {
                _selected=value as String;
              });
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_selected)));

                })
          ],
        ),
      ),
    );
  }
}

