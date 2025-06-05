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
        body: Stack(
          clipBehavior: Clip.none,

          children: [

                Container(
                  width: double.infinity,
                  height: 90,
                  color: Colors.redAccent,
                  child: Center(
                    child: Text("Profile",
                      style: TextStyle(
                          fontFamily: "serif",
                          fontWeight:FontWeight.bold,
                          fontSize: 40),textAlign: TextAlign.center,
                    ),
                  ),

                ),
            Positioned(
              left: 0,
              top:45,
              child: Container(
                child: Icon(Icons.menu),
              ),
            ),
             Positioned(
               top:120,
               left: 130,

               child: SizedBox(
                 height: 150,
                 width: 150,
                 child: ClipOval(
                   child: Container(
                     child: Image.asset("assets/images/ak.jpg")
                   ),
                 ),
               ),
             ),



           Padding(
             padding: const EdgeInsets.only(top: 270,left: 90),
             child: Card(
               child: Padding(
                 padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                 child: Text("Name : Akshaya\n ID: G123\n Designation: Trainee",style: TextStyle(fontSize: 20,fontFamily: "serif",fontWeight: FontWeight.bold),),
               ),
             ),
           ),
            
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 400),
                  child: Card(
                    elevation: 40,
                    color: Colors.grey,
                    child: ListTile(
                      leading: Icon(CupertinoIcons.person_alt_circle_fill),
                      title: Text("Personal Details",style: TextStyle(fontFamily: "serif",fontWeight: FontWeight.bold,fontSize: 30),),
                      trailing: Icon(Icons.more_horiz),
                    ),
                  ),
                ),
                ListTile(
                  

                )
              ],
            ),

            Positioned(
              top: 25,
              right: 8,
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("assets/images/ak.jpg"),
                
              ),
            ),

          ],
        ),

      ),
    );
  }
}
