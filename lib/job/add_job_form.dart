// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddJobPage extends StatefulWidget {
  const AddJobPage({super.key});

  @override
  _AddJobPageState createState() => _AddJobPageState();
}

class _AddJobPageState extends State<AddJobPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController jobNameController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController jobDescriptionController = TextEditingController();
  XFile? _image;

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Job'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: jobNameController,
                decoration: const InputDecoration(
                    labelText: 'Job Name',
                    icon: Icon(Icons.badge_rounded),
                    fillColor: Colors.orange),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter job name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: mobileNumberController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    labelText: 'Mobile Number',
                    icon: Icon(Icons.phone_android)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter mobile number';
                  }
                  // You can add more validation logic for phone number here
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              if (_image != null)
                Image.file(
                  File(_image!.path),
                  height: 100,
                ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                onPressed: _pickImage,
                child: const Text('Pick an Image'),
              ),
              TextFormField(
                controller: websiteController,
                keyboardType: TextInputType.url,
                decoration: const InputDecoration(
                    labelText: 'Website', icon: Icon(Icons.link_rounded)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter website';
                  }
                  // You can add URL validation logic here
                  return null;
                },
              ),
              TextFormField(
                controller: jobDescriptionController,
                maxLines: 3,
                decoration: const InputDecoration(
                    labelText: 'Job Description',
                    icon: Icon(Icons.text_fields)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter job description';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Form data is valid, you can submit it
                      // Access the form data using controllers:
                      String mobileNumber = mobileNumberController.text;
                      String jobName = jobNameController.text;
                      String website = websiteController.text;
                      String jobDescription = jobDescriptionController.text;

                      // Print the input data
                      print('Mobile Number: $mobileNumber');
                      print('Job Name: $jobName');
                      print('Website: $website');
                      print('Job Description: $jobDescription');

                      if (_image != null) {
                        print('Image Path: ${_image!.path}');
                      }
                    }
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
