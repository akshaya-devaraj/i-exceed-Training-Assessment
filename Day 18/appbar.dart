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
        body: Stack(
          clipBehavior: Clip.none,
          children: [



                Container(
                  width: double.infinity,
                  height: 90,
                  color: Colors.redAccent,
                  child: Center(
                    child: Text("Profile",
                      style: TextStyle(
                          fontFamily: "serif",
                          fontWeight:FontWeight.bold,
                          fontSize: 30),textAlign: TextAlign.center,
                    ),
                  ),

                ),
            Positioned(
              left: 0,
              top:45,
              child: Container(
                child: Icon(Icons.menu),
              ),
            ),


            Positioned(
              right: 7,
              top: 30,
              child: ClipOval(
                child: Image.asset("assets/images/ak.jpg",scale: 10,),
              ),
            )
          ],
        ),

      ),
    );
  }
}
