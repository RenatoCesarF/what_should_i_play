import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/shared/components/coverPlaceHolder.dart';
import 'package:project/shared/components/loadingLine.dart';
import 'package:shimmer/shimmer.dart';

class LoadingDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Container(
            child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 40,
                    child: TextButton(
                      // onLongPress: () =>
                      //     controller.backToDoYouMeanPage(),
                      onPressed: () => Modular.to.pop(),
                      child: Icon(Icons.arrow_back_rounded, size: 30, color: Theme.of(context).accentColor), //changed
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.bookmark_border_outlined,
                      size: 30,
                      color: Theme.of(context).accentColor, //changed
                    ),
                  ),
                ],
              ),
              backgroundColor: Theme.of(context).dividerColor,
              shadowColor: Colors.black,
              elevation: 24,
              centerTitle: true,
              leadingWidth: 0,
              automaticallyImplyLeading: false,
              leading: Container(),
              pinned: true,
              expandedHeight: 170.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Theme.of(context).dividerColor,
                ),
                titlePadding: EdgeInsets.zero,
                centerTitle: false,
                title: Container(
                  margin: const EdgeInsets.only(top: 30.0, left: 35, right: 35),
                  child: Center(
                      child: Shimmer.fromColors(
                          baseColor: Theme.of(context).backgroundColor,
                          highlightColor: Theme.of(context).primaryColor,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                            height: 15,
                            width: 300,
                          ))),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          width: double.infinity,
                          color: Theme.of(context).backgroundColor,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(18.0),
                                child: CoverPlaceHolder(
                                  scaleFactory: 1,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 15),
                                child: LoadingLine(width: 140, height: 13),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                            bottom: 40,
                            right: 30,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Shimmer.fromColors(
                                    baseColor: Theme.of(context).primaryColor,
                                    highlightColor: Theme.of(context).cardColor,
                                    child: Container(
                                      color: Theme.of(context).primaryColor,
                                      height: 60,
                                      width: 100,
                                    ))))
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text("Summary: ", style: TextStyle(fontSize: 16, color: Theme.of(context).accentColor, fontWeight: FontWeight.w900)),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5, left: 10),
                            child: Column(
                              children: [
                                LoadingLine(),
                                LoadingLine(),
                                LoadingLine(),
                                LoadingLine(),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 3, bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Text("Genres: ", style: TextStyle(fontSize: 16, color: Theme.of(context).accentColor, fontWeight: FontWeight.w900))),
                                LoadingLine(width: 70),
                                LoadingLine(width: 70),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )));
  }
}
