import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Myapi(),
    );
  }
}

class Myapi extends StatefulWidget {
  const Myapi({super.key});

  @override
  State<Myapi> createState() => _MyapiState();
}

class _MyapiState extends State<Myapi> {
  List<dynamic>? users;

  @override
  void initState() {
    super.initState();
    hitApi();
  }

  Future<void> hitApi() async {
    final response =
    await http.get(Uri.parse("https://reqres.in/api/users?page=2"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        users = data['data'];
      });
    } else {
      print("API Error: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Example"),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
        toolbarHeight: 90,
      ),
      body: users == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: users!.length,
        itemBuilder: (context, index) {
          final user = users![index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user['avatar']),
            ),
            title: Text(user['first_name'] + " " + user['last_name']),
            subtitle: Text(user['email']),
          );
        },
      ),
    );
  }
}
