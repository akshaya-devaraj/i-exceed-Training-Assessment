import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_application/api.dart';

final nameProvider=Provider((ref){
  return "Akshaya";
});

void main()
{
  runApp(ProviderScope(child:MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:MyHome());
  }
}

class MyHome extends ConsumerWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    String name=ref.watch(nameProvider);
    return Scaffold(body: Center(child: Text("Welcome"+name)),);
  }
}

