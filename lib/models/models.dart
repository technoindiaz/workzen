// ignore_for_file: non_constant_identifier_names

class JobPost {
  String post_name;
  String post_image;
  int mobile_phone;
  String website;
  String city;
  String post_description;
  JobPost(
      {required this.post_name,
      required this.post_image,
      required this.mobile_phone,
      required this.website,
      required this.city,
      required this.post_description});
}

class ShowJobPost {
  String post_image;
  int mobile_phone;
  String website;
  String share;

  ShowJobPost(
      {required this.post_image,
      required this.mobile_phone,
      required this.website,
      required this.share});
}
