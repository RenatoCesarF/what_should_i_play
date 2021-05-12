import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class OpenedImage extends StatelessWidget {
  final String imageURL;
  final bool rotate;
  final int uniqueID;
  final String tag;
  OpenedImage(this.imageURL, this.uniqueID, {this.rotate = true, this.tag = 'image'});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => Navigator.pop(context),
      child: Hero(
        tag: "$tag$uniqueID",
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: InteractiveViewer(
            child: RotatedBox(
                quarterTurns: rotate ? 1 : 4,
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: imageURL,
                  fadeInDuration: Duration(milliseconds: 200),
                )),
          ),
        ),
      ),
    );
  }
}
