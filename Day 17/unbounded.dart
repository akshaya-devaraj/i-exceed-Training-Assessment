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
      home: Scaffold(body: Column(children: [
      Container(color: Colors.pink,
      width: double.infinity,
      height:100),

    Expanded(
      child: ListView.builder(itemCount: 20,
          itemBuilder: (BuildContext context,int index){
        return ListTile(
            leading: Icon(Icons.person),
             title:Text("data $index") ,
             trailing: Icon(Icons.more_vert),
        );
      }),
    )
      
      ],
      )

    ),
    );
  }
}
