import 'package:flutter/material.dart';

class SmallCoverPlaceHolder extends StatelessWidget {
  final double scale;
  SmallCoverPlaceHolder({this.scale = 0.7});
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/placeholders/coverSmallPlaceHolder.png',
        scale: scale, fit: BoxFit.contain);
  }
}
