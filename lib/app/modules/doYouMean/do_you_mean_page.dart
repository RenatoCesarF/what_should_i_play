import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/app/modules/doYouMean/loading_do_you_mean_page.dart';
import 'package:project/shared/components/coverPlaceHolder.dart';
import 'package:project/shared/components/vertical_list_of_games.dart';
import 'package:project/shared/models/game_model.dart';
import 'package:transparent_image/transparent_image.dart';
import 'do_you_mean_controller.dart';
import '../../../shared/components/search_bar.dart';

class DoYouMeanPage extends StatefulWidget {
  final String gameName;
  const DoYouMeanPage({Key key, this.gameName}) : super(key: key);

  @override
  _DoYouMeanPageState createState() => _DoYouMeanPageState();
}

class _DoYouMeanPageState
    extends ModularState<DoYouMeanPage, DoYouMeanController> {
  //use 'controller' variable to access controller
  Future getGamesList;
  @override
  void initState() {
    super.initState();
    controller.searchBarController.text = widget.gameName;
    getGamesList = controller.findGames(widget.gameName, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getGamesList,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done ||
              controller.isSearching == true) {
            return LoadingDoYouMeanPage(controller);
          }

          return Observer(
            builder: (BuildContext context) {
              return Scaffold(
                  backgroundColor: Theme.of(context).primaryColor,
                  body: CustomScrollView(
                    controller: controller.scrollController,
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
                          background: SearchBar(controller),
                          titlePadding: EdgeInsets.zero,
                          centerTitle: false,
                          title: Padding(
                            padding: const EdgeInsets.only(
                              left: 18.0,
                              bottom: 13,
                            ),
                            child: Text(
                              "Do you mean",
                              style: TextStyle(
                                  color: Color(0xffD9D5EC),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SliverVerticalGameList(games: controller.games)
                    ],
                  ),
                  floatingActionButton: FloatingActionButton(
                    mini: true,
                    onPressed: controller.backToTop,
                    child: Icon(
                      Icons.arrow_circle_up_rounded,
                      color: Theme.of(context).backgroundColor,
                      size: 40,
                    ),
                  ));
            },
          );
        });
  }
}
