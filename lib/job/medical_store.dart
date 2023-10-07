import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:workzen/job/add_job_form.dart';

class MedicalStoreScreen extends StatefulWidget {
  const MedicalStoreScreen({super.key});

  @override
  _MedicalStoreScreenState createState() => _MedicalStoreScreenState();
}

class _MedicalStoreScreenState extends State<MedicalStoreScreen> {
  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://technoindiaz.pythonanywhere.com/api/job-posts-by-category/9/'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Job List'),
        backgroundColor: Colors.orange,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text('No data available');
          } else {
            // Use a ListView.builder to display items in cards
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                return Card(
                  elevation: 4.0, // Add elevation for a shadow effect
                  margin: const EdgeInsets.all(16.0), // Add margin for spacing
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Image.network(
                          item[
                              'post_image'], // Replace with the URL of your image field
                          // width: 50.0, // Set the desired width for the image
                          // height: 50.0, // Set the desired height for the image
                          // fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: ElevatedButton.icon(
                                onPressed: () async {
                                  Uri phoneno = Uri.parse('tel:+917388708678');
                                  // if (await launchUrl(phoneno)) {
                                  //   //dialer opened
                                  // } else {
                                  //   //dailer is not opened
                                  // }
                                },
                                icon: Icon(Icons.phone),
                                label: Text('Call'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: ElevatedButton.icon(
                                onPressed: () async {
                                  const url = 'https://technoindiaz.com';
                                  // if (await canLaunch(url)) {
                                  //   await launch(url);
                                  // } else {
                                  //   throw 'Could not launch $url';
                                  // }
                                },
                                icon: Icon(Icons.web_rounded),
                                label: Text('Website'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: ElevatedButton.icon(
                                // style: ButtonStyle(backgroundColor: Colors.black),
                                onPressed: () {
                                  // Share.share(
                                  //     'check out my website https://example.com',
                                  //     subject: 'Look what I made!');
                                },
                                icon: Icon(Icons.share),
                                label: Text('share'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: Colors.orange,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => JobForm()),
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
