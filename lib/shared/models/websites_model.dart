import 'package:flutter/rendering.dart';

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['url'] = this.url;

    return data;
  }
}
