import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:workzen/homepage/carousel_slider.dart';
import 'package:workzen/job/job_list.dart';
import 'package:workzen/job/videsh_job.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'WorkZen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          CarouselSlider(
            items: carouselItems,
            options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.8,
                aspectRatio: 16 / 9),
          ),
          const Text(
            "Note: Please Contact for any job related query: Team Videsh flight",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VideshJobScreen()),
                        );
                      },
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/client.png',
                                  width: 100,
                                  height: 50,
                                ),
                                const Text(
                                  'Client Interview',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => JobList()),
                        );
                      },
                      child: SizedBox(
                        child: Card(
                          elevation: 4,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/CV.png',
                                  width: 100,
                                  height: 50,
                                ),
                                const Text(
                                  'CV Selection/Shortlist',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/zoom.png',
                        width: 100,
                        height: 50,
                      ),
                      const Text(
                        'Telephonic Zoom Interview',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/certified.png',
                        width: 100,
                        height: 50,
                      ),
                      const Text(
                        'Indian License Holder',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              // Card(
              //   elevation: 4,
              //   child: Padding(
              //     padding: EdgeInsets.all(16.0),
              //     child: Row(
              //       children: [
              //         Text(
              //           'Helpline IMage ',
              //         ),
              //         Text('Helpline 24*7'),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }
}
