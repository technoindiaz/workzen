import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms & Conditions'),
        backgroundColor: Colors.orange,
      ),
      body: const Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "1. Workzen is only advertisement app, Workzen advise its user to cross checkup about Advertisement. Workzen will not be resposible for any loss or damage whatsover caused. \n2. On Workzen User can advertised, Advertisement will be show after cooling period of 12 hours. Wrokzen have right to Publish or remove advertisement. \n3. Advertising on Workzen is chargeable.",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
