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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(appBar: AppBar(backgroundColor: Colors.greenAccent,
        toolbarHeight: 90,),
        body: Column(children: [
           Expanded(
             child: Container(
                child: Image.network("https://www.i-exceed.com/wp-content/uploads/2024/10/appzillon-flow-1.webp"),
              ),
           ),


          SizedBox(
          height: 20,),
          Expanded(
            child: Container(
              child: Text("Appzillon by i-exceed is designed to cater to the needs of any financial institution irrespective of its size. Our clientele includes tier 1 banks, regional banks, community and cooperative banks, payment banks, Neo banks, micro finance institutions and so much more."),
              
            ),
          )
        ],),
      ),
    );
  }
}
