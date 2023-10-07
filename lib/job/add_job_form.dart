import 'package:flutter/material.dart';

class JobForm extends StatefulWidget {
  const JobForm({super.key});

  @override
  State<JobForm> createState() => _JobFormState();
}

class _JobFormState extends State<JobForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Job'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Enter Details',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Mobile Number'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'WhatsApp Number'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Website'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'City Name'),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Detail not more than 1000 character long'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  // Add image selection logic here
                },
                child: const Text('Post Image'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                
                onPressed: () {
                  // Add form submission logic here
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
