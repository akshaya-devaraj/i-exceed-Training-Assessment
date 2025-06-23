import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_application/changeCourse.dart';

import 'package:provider/provider.dart';

class MyCourses extends StatelessWidget {
  final String course;
  const MyCourses({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<ChangeCourse>(context, listen: false).changeSubject(course);
      },
      child: Container(
        padding: EdgeInsets.only(top: 40, left: 140, right: 40),
        child: Text(course),
        color: Colors.blue,
        height: 90,
        width: 300,
      ),
    );
  }
}