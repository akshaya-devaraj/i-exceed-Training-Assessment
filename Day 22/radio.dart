import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MyRadio());
}

class MyRadio extends StatefulWidget {
  const MyRadio({super.key});

  @override
  State<MyRadio> createState() => _MyRadioState();
}

class _MyRadioState extends State<MyRadio> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyRadioview());
  }
}



class MyRadioview extends StatefulWidget {
  const MyRadioview({super.key});

  @override
  State<MyRadioview> createState() => _MyRadioviewState();
}

class _MyRadioviewState extends State<MyRadioview> {

  int _value=1;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("Radio Widget"),
          toolbarHeight: 90,
          backgroundColor: Colors.indigo,
        ),
        body: Row(
          children: [
            Radio(value: 1, groupValue: _value, onChanged: (value){
              setState(() {
                _value=value!;
              });

            },),Text("Male"),SizedBox(width: 20,),
            Radio(value: 2, groupValue: _value, onChanged: (value){
              setState(() {
                _value=value!;
              });

            },),Text("Female"),SizedBox(width: 20,)
          ],
        ),
      );

  }
}
