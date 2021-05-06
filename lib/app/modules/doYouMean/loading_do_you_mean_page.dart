import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/shared/components/coverPlaceHolder.dart';
import 'package:project/shared/components/loadingLine.dart';
import 'package:project/shared/models/game_model.dart';
import 'do_you_mean_controller.dart';
import '../../../shared/components/search_bar.dart';

class LoadingDoYouMeanPage extends StatefulWidget {
  final DoYouMeanController controller;
  LoadingDoYouMeanPage(this.controller);
  @override
  _LoadingDoYouMeanPageState createState() => _LoadingDoYouMeanPageState();
}

class _LoadingDoYouMeanPageState extends State<LoadingDoYouMeanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Theme.of(context).dividerColor,
              shadowColor: Colors.black,
              elevation: 24,
              centerTitle: true,
              leadingWidth: 0,
              automaticallyImplyLeading: false,
              leading: Container(),
              pinned: true,
              // snap: true,
              // floating: true,
              expandedHeight: 140.0,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: [],
                background: SearchBar(widget.controller),
                titlePadding: EdgeInsets.zero,
                centerTitle: false,
                title: Padding(
                  padding: const EdgeInsets.only(
                    left: 18.0,
                    bottom: 13,
                  ),
                  child: Text(
                    "Do you mean",
                    style: TextStyle(color: Color(0xffD9D5EC), fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    decoration: new BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        )),
                    margin: const EdgeInsets.only(top: 8.0, bottom: 8, left: 8, right: 15),
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: CoverPlaceHolder(),
                          ),
                        ),
                        Container(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LoadingLine(width: 120),
                              Container(height: 10),
                              LoadingLine(
                                width: 220,
                                height: 12,
                              ),
                              LoadingLine(
                                width: 220,
                                height: 12,
                              ),
                              LoadingLine(
                                width: 220,
                                height: 12,
                              ),
                              LoadingLine(
                                width: 220,
                                height: 12,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                childCount: 4,
              ),
            ),
          ],
        ));
  }
}
