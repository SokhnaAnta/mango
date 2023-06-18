import 'package:flutter/material.dart';
import 'package:mango/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) =>
      FutureBuilder(builder: (context, snapshot) {
        return const MaterialApp(
            debugShowCheckedModeBanner: false, home: HomeScreen());
      });
}
