// ignore_for_file: non_constant_identifier_names

class JobPost {
  String post_name;
  String post_image;
  int mobile_phone1;
  int mobile_phone2;
  int whatsapp_phone;
  String city;
  String post_description;
  String updated_at;

  JobPost({
    required this.post_name,
    required this.post_image,
    required this.mobile_phone1,
    required this.mobile_phone2,
    required this.whatsapp_phone,
    required this.city,
    required this.post_description,
    required this.updated_at,
  });
}

class ShowJobPost {
  String post_image;
  int mobile_phone1;
  int mobile_phone2;
  int whatsapp_phone;
  String city;
  String share;

  ShowJobPost(
      {required this.post_image,
      required this.mobile_phone1,
      required this.mobile_phone2,
      required this.whatsapp_phone,
      required this.city,
      required this.share});
}

