import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class JobListScreen extends StatefulWidget {
  @override
  _JobListScreenState createState() => _JobListScreenState();
}

class _JobListScreenState extends State<JobListScreen> {
  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://workzen.in/api/job-posts-by-category/5/'));

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
        title: const Text('Job List'),
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
                  elevation: 2.0, // Add elevation for a shadow effect
                  margin: const EdgeInsets.all(10.0), // Add margin for spacing
                  child: ListTile(
                    leading: Image.network(
                      item[
                          'post_image'], // Replace with the URL of your image field
                      width: 50.0, // Set the desired width for the image
                      height: 50.0, // Set the desired height for the image
                      fit: BoxFit.cover, // Adjust the fit as needed
                    ),
                    title: Text(item['post_name']),
                    // Add more widgets to display other fields as needed.
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
