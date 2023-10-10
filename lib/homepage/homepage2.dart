// ignore_for_file: depend_on_referenced_packages

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:workzen/homepage/carousel_slider.dart';
import 'package:workzen/homepage/homepage.dart';
import 'package:marquee_text/marquee_text.dart';
import 'package:workzen/job/django_app_job_list.dart';
import 'package:workzen/job/hospital_job.dart';
import 'package:workzen/job/hotel_job.dart';
import 'package:workzen/job/job_list.dart';
import 'package:workzen/job/medical_store.dart';
import 'package:workzen/job/school_job.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Work Zen'),
        backgroundColor: Colors.orange,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // ignore: prefer_const_constructors
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.orange),
              accountName: const Text('Work Zen'),
              accountEmail: const Text(
                'info@technoindiaz.com',
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/workzen_logo.png'),
                backgroundColor: Colors.white,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.facebook),
              title: const Text('Facebook'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JobListScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Phone'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Terms & Conditions'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Share'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: carouselItems,
              options: CarouselOptions(
                  // height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  // viewportFraction: 0.8,
                  aspectRatio: 16 / 9),
            ),

            const MarqueeText(
              text: TextSpan(
                  text:
                      'Note: Please contact for any advertisement and query: Team Videsh Flight'),
              style: TextStyle(
                  fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
              speed: 20,
            ),

            // Card 1 Layout
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Homepage()),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      child: Container(
                        // width: 200,
                        padding: const EdgeInsets.all(16),
                        child: const Column(
                          children: [
                            Icon(
                              Icons.pages,
                              size: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'विदेश में नौकरी',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const JobList()),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      child: Container(
                        // width: 200,
                        padding: const EdgeInsets.all(16),
                        child: const Column(
                          children: [
                            Icon(
                              Icons.work,
                              size: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'देश में नौकरी',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SchoolJobScreen(),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      child: Container(
                        // width: 200,
                        padding: const EdgeInsets.all(16),
                        child: const Column(
                          children: [
                            Icon(
                              Icons.supervised_user_circle,
                              size: 30,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'स्कूल जॉब',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Card 2
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HospitalJobScreen()),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      child: Container(
                        // width: 200,
                        padding: const EdgeInsets.all(16),
                        child: const Column(
                          children: [
                            Icon(
                              Icons.hotel_sharp,
                              size: 30,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'हॉस्पिटल जॉब',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HotelJobScreen()),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      child: Container(
                        // width: 200,
                        padding: const EdgeInsets.all(16),
                        child: const Column(
                          children: [
                            Icon(
                              Icons.hotel_class,
                              size: 30,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'रेस्टुरेंट जॉब',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MedicalStoreScreen()),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      child: Container(
                        // width: 200,
                        padding: const EdgeInsets.all(16),
                        child: const Column(
                          children: [
                            Icon(
                              Icons.medical_information,
                              size: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'मेडिकल स्टोर',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MedicalStoreScreen()),
                );
              },
              child: Card(
                elevation: 2,
                child: Image.asset(
                  'assets/images/job.jpeg',
                  width: double.infinity,
                  height: 80,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Card(
              elevation: 2,
              child: Image.asset(
                'assets/images/add_banner_2.png',
                width: double.infinity,
                height: 80,
                fit: BoxFit.fill,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  elevation: 2,
                  child: Container(
                    // width: 100,
                    // height: 100,
                    padding: const EdgeInsets.all(16),
                    child: const Column(
                      children: [
                        Icon(
                          Icons.pages,
                          size: 24,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text('Place for Ad')
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 2,
                  child: Container(
                    // width: 100,
                    // height: 100,
                    padding: const EdgeInsets.all(16),
                    child: const Column(
                      children: [
                        Icon(
                          Icons.pages,
                          size: 24,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text('Place for ad')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
