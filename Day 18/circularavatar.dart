import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_application/card.dart';

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
      home: Scaffold(
        body: Center(
          child: CircleAvatar(
            backgroundColor: Colors.deepPurpleAccent,
            radius: 75,

            child: CircleAvatar(
              radius: 70,
             // minRadius: 10,
             backgroundImage: AssetImage("assets/images/ak.jpg"),

            ),
          ),
        ),
      ),
    );
  }
}
