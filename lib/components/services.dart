// ignore_for_file: depend_on_referenced_packages, deprecated_member_use, unused_element

import 'package:url_launcher/url_launcher.dart';

void _callNumber(String phoneNumber) async {
  String url = "tel://$phoneNumber";
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

// void _shareJobDetail(String jobDescription) {
//   final RenderBox box = context.findRenderObject() as RenderBox;
//   final String text = 'Check out this job: $jobDescription';

//   Share.share(
//     text,
//     sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
//   );
// }
