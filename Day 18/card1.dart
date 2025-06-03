import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
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
          child: ClipOval(
            child: Container(
              width: 250,  // 👈 circle diameter
              height: 250,
              color: Colors.grey.shade300,
              child: Image.network(
                "https://www.i-exceed.com/wp-content/uploads/2024/08/i-exceed-ippb.webp",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
