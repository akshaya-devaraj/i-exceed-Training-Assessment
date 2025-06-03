import 'package:flutter/cupertino.dart';
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
    return MaterialApp(home:
    Scaffold(
      body: Center(
        child: Card(
        color: Colors.grey,
          elevation: 100,
          shadowColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              side:BorderSide(color: CupertinoColors.activeBlue,width: 10) ),
              borderOnForeground: false,
              semanticContainer: false,
         child: Container(
           width: 500,
           height: 500,
           child: Image(image: NetworkImage("https://www.i-exceed.com/wp-content/uploads/2024/10/appzillon-flow-1.webp")),
         ),


      ),
      ),
    ),
    );
  }
}
