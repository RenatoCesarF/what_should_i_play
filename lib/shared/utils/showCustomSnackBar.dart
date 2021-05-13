import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, {String text}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    padding: EdgeInsets.only(top: 7, bottom: 7),
    duration: Duration(seconds: 3),
    content: Center(
      heightFactor: 1.3,
      child: Text(
        text == null ? "Error" : text,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    ),
    backgroundColor: Theme.of(context).accentColor,
  ));
}
