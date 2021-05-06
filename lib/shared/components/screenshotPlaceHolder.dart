import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ScreenshotPlaceHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).primaryColor,
      highlightColor: Theme.of(context).cardColor,
      child: Container(
        color: Theme.of(context).primaryColor,
        height: 312,
        width: 555,
      ),
    );
  }
}
