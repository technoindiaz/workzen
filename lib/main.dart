import 'package:flutter/material.dart';

import 'package:workzen/homepage/homepage2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'WorkZen',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        // colorScheme:
        //     ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 162, 3)),
        // useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
