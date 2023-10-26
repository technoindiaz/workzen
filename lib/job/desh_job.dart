// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:workzen/job/add_job_form.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DeshJobScreen extends StatefulWidget {
  const DeshJobScreen({super.key});

  @override
  _DeshJobScreenState createState() => _DeshJobScreenState();
}

class _DeshJobScreenState extends State<DeshJobScreen> {
  Future<List<dynamic>> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('https://technoindiaz.pythonanywhere.com/api/desh_me_job/'),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desh Me Job'),
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
                final phoneNumber = item['mobile_phone'].toString();
                final websiteUrl = item['website'];
                final imageUrl = item['post_image'];
                final postDescription = item['post_description'];

                return Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Image.network(imageUrl),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: ElevatedButton.icon(
                                onPressed: () => _callNumber(phoneNumber),
                                icon: const Icon(Icons.phone),
                                label: const Text('Call'),
                              ),
                            ),
                            if (websiteUrl != null)
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: ElevatedButton.icon(
                                  onPressed: () => _openWebsite(websiteUrl),
                                  icon: const Icon(Icons.link),
                                  label: const Text('Website'),
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: ElevatedButton.icon(
                                onPressed: () =>
                                    _shareJobDetail(context, postDescription),
                                icon: const Icon(Icons.share),
                                label: const Text('Share'),
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
            MaterialPageRoute(builder: (context) => AddJobPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

void _callNumber(String phoneNumber) async {
  String url = "tel://+91 $phoneNumber";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not call $phoneNumber';
  }
}

void _openWebsite(String? websiteUrl) async {
  if (websiteUrl != null && await canLaunch(websiteUrl)) {
    await launch(websiteUrl);
  } else {
    throw 'Could not launch website';
  }
}

void _shareJobDetail(BuildContext context, String jobDescription) {
  final RenderBox box = context.findRenderObject() as RenderBox;
  final String text = 'Check out this job: $jobDescription';

  Share.share(
    text,
    sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
  );
}
