import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_application/main.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      body: Center(
        child: Text.rich(
            TextSpan(text: "Hello",style:
            TextStyle(
                fontSize: 50,
                fontFamily: "serif",
                color: Colors.black),
                children:
                [TextSpan(
                    text: "Team",
                    style: TextStyle(
                        fontFamily: "sans serif",
                        fontSize: 50,
                        color: Colors.redAccent),
            recognizer: TapGestureRecognizer()
        ..onTap=()
        {
          print("Text.Rich is printed");
        }
        )
                ] //children
        )
        ),
      ),
    ),);
  }
}
