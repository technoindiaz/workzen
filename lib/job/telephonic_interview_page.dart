import 'package:flutter/material.dart';

class TelephonicInterview extends StatefulWidget {
  const TelephonicInterview({super.key});

  @override
  State<TelephonicInterview> createState() => _TelephonicInterviewState();
}

class _TelephonicInterviewState extends State<TelephonicInterview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Telephonic Interview'),
        backgroundColor: Colors.orange,
      ),
      body: const Text('I am telephonics interview page'),
    );
  }
}
