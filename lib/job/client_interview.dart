// import 'dart:io';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:workzen/job/add_job_form.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:share/share.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:path_provider/path_provider.dart';

// import 'package:workzen/models/models.dart';

class ClientInterview extends StatefulWidget {
  const ClientInterview({super.key});

  @override
  State<ClientInterview> createState() => _ClientInterviewState();
}

class _ClientInterviewState extends State<ClientInterview> {
  Future<List<dynamic>> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://technoindiaz.pythonanywhere.com/api/client-interview/'),
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
        title: const Text('Client Interview'),
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
                // final websiteUrl = item['website'];
                final imageUrl = item['post_image'];
                final share = item['share'];
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
                            // Padding(
                            //   padding: const EdgeInsets.all(2.0),
                            //   child: ElevatedButton.icon(
                            //     onPressed: () => _callNumber(phoneNumber),
                            //     icon: const Icon(Icons.phone),
                            //     label: const Text('Call'),
                            //   ),
                            // ),

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
                                onTap: () {
                                  _launchWhatsapp(context);
                                },
                                child: Image.asset(
                                    'assets/images/chat_button.png'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: InkWell(
                                onTap: () => _callNumber(share),
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

_launchWhatsapp(BuildContext context) async {
  var whatsapp = "+917388708678";
  var whatsappAndroid = Uri.parse("whatsapp://send?phone=$whatsapp&text=hello");
  if (await canLaunchUrl(whatsappAndroid)) {
    await launchUrl(whatsappAndroid);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("WhatsApp is not installed on the device"),
      ),
    );
  }
}