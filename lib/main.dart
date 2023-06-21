import 'package:flutter/material.dart';
import 'package:mango/home.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) =>
      FutureBuilder(builder: (context, snapshot) {
        return const MaterialApp(
            debugShowCheckedModeBanner: false, home: WelcomeScreen());
      });
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/mango.jpg',
            height: 200,
            width: 180,
            fit: BoxFit.fill,
          ),
          const Text("Febaru Mango Yi",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0))
        ],
      )),
    );
  }
}
