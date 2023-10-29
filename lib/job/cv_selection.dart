// ignore_for_file: deprecated_member_use, prefer_const_constructors, depend_on_referenced_packages, unused_local_variable

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:workzen/job/add_job_form.dart';
import 'package:share/share.dart';

class CVSelectionPage extends StatefulWidget {
  const CVSelectionPage({super.key});

  @override
  State<CVSelectionPage> createState() => _CVSelectionPageState();
}

class _CVSelectionPageState extends State<CVSelectionPage> {
  Future<List<dynamic>> fetchData() async {
    final response = await http.get(
        Uri.parse('https://technoindiaz.pythonanywhere.com/api/cv-selection/'));

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
        title: const Text('CV Selection'),
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
                // final post_title = item['post_name'].toString();
                final mobile_phone1 = item['mobile_phone1'].toString();
                final mobile_phone2 = item['mobile_phone2'].toString();
                final whatsapp_phone = item['whatsapp_phone'].toString();
                // final websiteUrl = item['website'];
                final imageUrl = item['post_image'];
                // final share = item['share'];
                // final postDescription = item['post_description'];

                return Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.all(9.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Image.network(imageUrl),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: InkWell(
                                onTap: () => _callNumber(mobile_phone1),
                                child: Image.asset(
                                  'assets/images/call_button.png',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: InkWell(
                                onTap: () => _callNumber(mobile_phone2),
                                child: Image.asset(
                                    'assets/images/call_button.png'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: InkWell(
                                onTap: () => _launchWhatsApp(
                                    whatsapp_phone), // WhatsApp launcher
                                child: Image.asset(
                                    'assets/images/chat_button.png'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: InkWell(
                                onTap: () => _shareJobPost(item),
                                child: Image.asset(
                                    'assets/images/share_button.png'),
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

_launchWhatsApp(String phoneNumber) async {
  final url = "https://api.whatsapp.com/send?phone=$phoneNumber";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Whatsapp not available on $phoneNumber';
  }
}

void _shareJobPost(Map<String, dynamic> item) {
  final String post_title = item['post_name'].toString();
  // final String jobDescription = item['description'].toString();
  final String imageUrl = item['post_image'].toString();

  final textToShare = "Check out this job on workzen: $post_title";
  final imageToShare = imageUrl;

  Share.share(textToShare,
      subject: post_title,
      sharePositionOrigin:
          Rect.fromCenter(center: Offset(0, 0), width: 50, height: 50));
}
