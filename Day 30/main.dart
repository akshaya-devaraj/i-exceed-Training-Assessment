import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_application/changeCourse.dart';
import 'package:my_application/courses.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => ChangeCourse(), child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 120),
            Container(
              padding: EdgeInsets.only(top: 40, left: 140, right: 40),
              child: Text(
                "We are learning " + Provider.of<ChangeCourse>(context).sub,
              ),
              color: Colors.grey,
              height: 90,
              width: double.infinity,
            ),
            SizedBox(height: 100),
            MyCourses(course: "Java"),
            SizedBox(height: 20),
            MyCourses(course: "python"),
            SizedBox(height: 20),
            MyCourses(course: "Go"),
            SizedBox(height: 20),
            MyCourses(course: "Dart"),
          ],
        ),
      ),
    );
  }
}