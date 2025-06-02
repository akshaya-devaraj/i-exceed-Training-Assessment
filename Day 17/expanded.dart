import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_project/file1.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(appBar: AppBar(backgroundColor: Colors.greenAccent,
      toolbarHeight: 90,),
       body: Column(children: [
         Expanded(
           flex: 3,
           child: Container(
             color: Colors.redAccent,
             width:100,
             height: 500,
           ),
         ),
         Expanded(
           flex: 2,
           child: Container(
             color: Colors.yellow,
             width:100,
             height: 500,
           
           ),
         )
       ],),
     ),
    );
  }
}
