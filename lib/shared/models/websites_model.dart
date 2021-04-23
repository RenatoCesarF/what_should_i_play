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
}

/*

INTERPRETATIONS OF CATEGORY

official	   1
wikia	       2
wikipedia	   3
facebook	   4
twitter	     5
twitch	     6
instagram	   8
youtube	     9
iphone	     10
ipad	       11
android	     12
steam	       13
reddit	     14
itch	       15
epicgames	   16
gog	         17
discord	     18
*/
