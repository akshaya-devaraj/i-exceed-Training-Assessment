import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:isolate';

void main() {
  runApp(myIso());
}

class myIso extends StatelessWidget {
  const myIso({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: CupertinoColors.white,
        appBar: AppBar(
          title: Text("Demo-Isolates"),
          backgroundColor: Colors.cyan,
          centerTitle: true,
          toolbarHeight: 90.0,
        ),
        body: Center(
          child: Column(
            children: [
              Image(
                image: AssetImage('assets/images/air.gif'),
                width: 200.0,
              ),

              //Asynchronous method
              ElevatedButton(
                onPressed: () async {
                  var res = await task1();
                  print('Result 1:$res');
                },
                child: Text("Calculate 1"),
              ),

              ElevatedButton(
                onPressed: () async {
                  final receivePort = ReceivePort();
                  await Isolate.spawn(task2, receivePort.sendPort);
                  receivePort.listen((tot) {
                    print('Result 2: $tot');
                  });
                },
                child: Text("Calculate 2"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<int> task1() async {
  var tot = 0;
  for (var i = 0; i < 1000000000; i++) {
    tot += i;
  }
  return tot;
}

task2(SendPort sendPort) {
  var tot = 0;
  for (var i = 0; i < 1000000000; i++) {
    tot += i;
  }
  sendPort.send(tot);
  ;
}

