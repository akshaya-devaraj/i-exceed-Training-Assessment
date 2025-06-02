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
    return MaterialApp(home: Scaffold(
      body: Center(child: Text("Today, i-exceed technology solutions power the digital solutions of over 110 banks and their 75 million customers. As the number of individuals that utilize digital banking services* is expected to rise to almost 4 billion by the end of 2026, it has become vital for banks to offer seamless and consistent experiences to stay at the top of their game.",
    maxLines:5,
        textAlign: TextAlign.justify,
        textDirection: TextDirection.ltr,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: TextStyle(
          fontSize: 30.0,
            fontFamily: "Aerial",
       color: Colors.purpleAccent,
          fontWeight: FontWeight.normal,
          letterSpacing: 2.0,
            wordSpacing: 1.0,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationColor: CupertinoColors.activeGreen,
          decorationThickness: 3.0,
          decorationStyle: TextDecorationStyle.wavy,
          shadows: [
            Shadow(color: Colors.cyanAccent,
            offset: Offset(10, 50),
            blurRadius: 90),

          ]

        ),
    )
    ),
    ),
    );
  }
}
