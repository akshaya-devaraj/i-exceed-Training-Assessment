import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner:false,home: checkBox(),));
}

class checkBox extends StatefulWidget {
  const checkBox({super.key});

  @override
  State<checkBox> createState() => _checkBoxState();
}

class _checkBoxState extends State<checkBox> {

  bool ch1=false;
  bool ch2=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      toolbarHeight: 80.0,
      backgroundColor: Colors.deepPurpleAccent,
      title: Text("CheckBox Demo"),
    ),
      body: Column(
        children: [
          Row(
            children: [
              Checkbox(value: ch1, onChanged: (value){
                setState(() {
                  ch1=value!;
                },);
              }),
              Text("Java"),
              Checkbox(value: ch2, onChanged: (value){
                setState(() {
                  ch2=value!;
                });
              }),
              Text("Dart")
            ],
          ),
        ],
      ),
    );
  }
}
