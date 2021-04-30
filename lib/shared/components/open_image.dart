import 'package:flutter/material.dart';

class OpenedImage extends StatelessWidget {
  final String imageURL;
  final bool rotate;
  final int uniqueID;
  OpenedImage(this.imageURL, this.uniqueID, {this.rotate = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => Navigator.pop(context),
      child: Hero(
        tag: "image$uniqueID",
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: InteractiveViewer(
            child: RotatedBox(
              quarterTurns: rotate ? 1 : 4,
              child: Image.network(
                imageURL,
                matchTextDirection: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
