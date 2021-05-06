import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CoverPlaceHolder extends StatelessWidget {
  final double scaleFactory;
  final String gameName;
  CoverPlaceHolder({this.scaleFactory, this.gameName});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Theme.of(context).primaryColor,
        highlightColor: Theme.of(context).cardColor,
        child: Container(
          height: scaleFactory == null ? 120 : 120 * scaleFactory * 2.93,
          width: scaleFactory == null ? 90 : 90 * scaleFactory * 2.93,
          color: Theme.of(context).primaryColor,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Text(gameName != null ? gameName : "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).canvasColor,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
        ));
    //90/128
  }
}
