import 'package:flutter/material.dart';

class CoverPlaceHolder extends StatelessWidget {
  final double scaleFactory;
  CoverPlaceHolder({this.scaleFactory});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: scaleFactory == null ? 120 : 120 * scaleFactory * 2.93,
      width: scaleFactory == null ? 90 : 90 * scaleFactory * 2.93,
      color: Theme.of(context).primaryColor,
    );
    //90/128
  }
}
