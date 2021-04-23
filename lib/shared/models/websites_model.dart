class Websites {
  int category;
  String url;

  Websites({this.category, this.url});

  Websites.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null) {
      category = json['category'];
    }

    if (json['url'] != null) {
      url = json['url'];
    }
  }
}
