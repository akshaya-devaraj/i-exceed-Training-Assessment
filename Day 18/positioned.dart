import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
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
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.blueGrey,
          title: Text("Home"),
          centerTitle: true,
          toolbarHeight: 90,
        ),
        body: Stack(
          children: [
            Positioned(
              top: 50,
              left:50,
              child: Container(
                width: 300,
                height: 500,
                color: Colors.grey,
                child: Text("Welcome to I-Exceed",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              ),
            ),
            Positioned(
              top: 140,
              left: 100,
              child: Container(
                width: 200,
                height: 150,
                color: Colors.white,
                child: Image.network("https://www.i-exceed.com/wp-content/uploads/2022/08/i-exceed-Hi-Res-copy-1.webp"),
              ),
            ),
            Positioned(
              bottom: 400,
              left: 170,
              child: Container(
                child: Text.rich(TextSpan(text: "Login",style: TextStyle(fontSize: 20,fontFamily: "serif",fontWeight: FontWeight.bold),recognizer: TapGestureRecognizer() ..onTap=()
                {
                  print("Login is tapped");
                })),
              ),
            )
          ],
        ),
      ),
    );
  }
}
