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
        body:Column(
          children: [
            Container(
              height: 100,
              width: 200,
              color: Colors.pinkAccent,
            ),
            Divider(
              thickness: 2,
              height: 10,
              color: CupertinoColors.black,
              indent: 20,
              endIndent: 20,
            ),
            Container(
              height: 100,
              width: 200,
              color: Colors.blueGrey,
            )
          ],

        )
      ),
    );
  }
}
