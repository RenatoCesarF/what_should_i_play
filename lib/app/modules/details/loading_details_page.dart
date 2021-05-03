import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/shared/components/loadingLine.dart';
import 'package:shimmer/shimmer.dart';

class LoadingDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  color: Theme.of(context).primaryColor,
                  padding: EdgeInsets.only(top: 30, bottom: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 40,
                        child: TextButton(
                          onPressed: () => Modular.to.pop(),
                          child: Icon(Icons.arrow_back_rounded,
                              size: 30,
                              color: Theme.of(context).accentColor), //changed
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: LoadingLine(
                            width: 150,
                            height: 18,
                          ),
                        ),
                      ),
                      SizedBox(width: 40, child: Container()),
                    ],
                  ),
                ),
                Container(
                  height: 3,
                  color: Theme.of(context).backgroundColor,
                )
              ],
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.only(top: 88, bottom: 8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 20, bottom: 50),
                              width: double.infinity,
                              color: Theme.of(context).backgroundColor,
                              child: Column(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(18.0),
                                      child: Shimmer.fromColors(
                                          baseColor:
                                              Theme.of(context).primaryColor,
                                          highlightColor:
                                              Theme.of(context).cardColor,
                                          child: Container(
                                            color: Colors.white,
                                            height: 352,
                                            width: 264,
                                          ))),
                                ],
                              ),
                            ),
                            Positioned(
                                bottom: 20,
                                right: 30,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Shimmer.fromColors(
                                        baseColor:
                                            Theme.of(context).primaryColor,
                                        highlightColor:
                                            Theme.of(context).cardColor,
                                        child: Container(
                                          color: Colors.white,
                                          height: 56,
                                          width: 74,
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
                                    child: Text("Summary: ",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color:
                                                Theme.of(context).accentColor,
                                            fontWeight: FontWeight.w900)),
                                  ),
                                  LoadingLine(),
                                  LoadingLine(),
                                  LoadingLine(),
                                  LoadingLine(),
                                  Container(
                                    margin: EdgeInsets.only(top: 3, bottom: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                margin: EdgeInsets.only(top: 5),
                                                child: Text("Genres: ",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Theme.of(context)
                                                            .accentColor,
                                                        fontWeight:
                                                            FontWeight.w900))),
                                            LoadingLine(width: 80),
                                            LoadingLine(width: 80),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ]))
                      ])),
            ))
          ]),
    );
  }
}
