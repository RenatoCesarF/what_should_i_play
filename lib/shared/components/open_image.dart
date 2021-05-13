import 'package:flutter/material.dart';
import 'package:project/shared/models/game_model.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

class OpenedImage extends StatelessWidget {
  final String imageURL;
  final int uniqueID;
  final String tag;
  final List<String> imageUrlList;
  OpenedImage(this.imageURL, this.uniqueID,
      {this.tag = 'image', this.imageUrlList});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => Navigator.pop(context),
      child: Hero(
        tag: "$tag$uniqueID",
        child: Container(
            color: Theme.of(context).backgroundColor,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                autoPlay: false,
                enlargeCenterPage: true,
              ),
              items: imageUrlList != null
                  ? imageUrlList.map((url) {
                      return InteractiveViewer(
                        maxScale: 10,
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: url,
                          fadeInDuration: Duration(milliseconds: 200),
                        ),
                      );
                    }).toList()
                  : InteractiveViewer(
                      maxScale: 10,
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: imageURL,
                        fadeInDuration: Duration(milliseconds: 200),
                      ),
                    ),
            )),
      ),
    );
  }
}
