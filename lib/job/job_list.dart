// ignore_for_file: deprecated_member_use, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:workzen/job/add_job_form.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';


import 'package:workzen/models/models.dart';

class JobList extends StatefulWidget {
  const JobList({super.key});

  @override
  State<JobList> createState() => _JobListState();
}

class _JobListState extends State<JobList> {
  List<JobPost> myJobPost = [];
  // void fetchData() async {
  //   try {
  //     http.Response response = await http.get(Uri.parse(api));
  //     var data = json.decode(response.body);
  //     data.forEach(
  //       (jobpost) {
  //         JobPost j = JobPost(
  //             post_name: jobpost['post_name'],
  //             post_image: jobpost['post_image'],
  //             mobile_phone: jobpost['mobile_phone'],
  //             website: jobpost['website'],
  //             city: jobpost['city'],
  //             post_description: jobpost['post_description']);
  //         myJobPost.add(j);
  //       },
  //     );
  //     print(myJobPost.length);
  //   } catch (e) {
  //     print("Error is $e");
  //   }
  // }

  // @override
  // void initState() {
  //   fetchData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job List'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 4,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/Hospital Add.png'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            Uri phoneno = Uri.parse('tel:+917388708678');
                            if (await launchUrl(phoneno)) {
                              //dialer opened
                            } else {
                              //dailer is not opened
                            }
                          },
                          icon: const Icon(Icons.phone),
                          label: const Text('Call'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            const url = 'https://technoindiaz.com';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          icon: const Icon(Icons.web_rounded),
                          label: const Text('Website'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ElevatedButton.icon(
                          // style: ButtonStyle(backgroundColor: Colors.black),
                          onPressed: () {
                            Share.share(
                                'check out my website https://example.com',
                                subject: 'Look what I made!');
                          },
                          icon: const Icon(Icons.share),
                          label: const Text('share'),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    '25-09-2023',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddJobPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
