// ignore_for_file: deprecated_member_use, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:workzen/job/add_job_form.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LicenseHolderPage extends StatefulWidget {
  const LicenseHolderPage({super.key});

  @override
  State<LicenseHolderPage> createState() => _LicenseHolderPageState();
}

class _LicenseHolderPageState extends State<LicenseHolderPage> {
  Future<List<dynamic>> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://technoindiaz.pythonanywhere.com/api/license-holder/'),
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
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('License Holder'),
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
                final mobile_phone1 = item['mobile_phone1'].toString();
                final mobile_phone2 = item['mobile_phone2'].toString();
                final whatsapp_phone = item['whatsapp_phone'].toString();
                final imageUrl = item['post_image'];
                final city = item['city'];
                final updated_at = ['updated_at'];

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
                                onPressed: () => _callNumber(mobile_phone1),
                                icon: const Icon(Icons.phone),
                                label: const Text('Call'),
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () => _callNumber(mobile_phone2),
                              icon: const Icon(Icons.phone),
                              label: const Text('Call'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: ElevatedButton.icon(
                                onPressed: () => _callNumber(whatsapp_phone),
                                icon: const Icon(Icons.phone),
                                label: const Text('Call'),
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
