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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(
      child: RichText(text:
      TextSpan(
          text: "Login",
          style: TextStyle(
              fontFamily: "Aerial",
              color: Colors.red,
              fontSize: 30),
        recognizer: TapGestureRecognizer()
          ..onTap=()
            {
              print("Login successful");
            }
      ),

      ),
    ),
    ),
    );
  }
}
