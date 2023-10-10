import 'package:flutter/material.dart';

class LicenseHolder extends StatefulWidget {
  const LicenseHolder({super.key});

  @override
  State<LicenseHolder> createState() => _LicenseHolderState();
}

class _LicenseHolderState extends State<LicenseHolder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Licence Holder'),
        backgroundColor: Colors.orange,
      ),
      body: Text('I am Licence holder'),
    );
  }
}
