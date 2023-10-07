// ignore_for_file: deprecated_member_use
import 'package:url_launcher/url_launcher.dart';


void _launchPhoneDialer(String phoneNumber) async {
  final url = 'tel:$phoneNumber';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

