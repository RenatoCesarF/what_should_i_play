import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/app/modules/search/search_module.dart';
import 'package:project/app/modules/search/search_page.dart';
import 'package:project/shared/components/loading.dart';
import 'package:project/shared/components/coverPlaceHolder.dart';
import 'package:project/shared/models/game_model.dart';
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

  @override
  void initState() {
    super.initState();
    controller.searchBarController.text = widget.gameName;
    controller.findGames(widget.gameName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Observer(
        builder: (BuildContext context) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
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
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    Game game = controller.games[index];

                    if (game == null) {
                      return Container();
                    }
                    return Dismissible(
                      onDismissed: (key) => controller.games
                          .removeWhere((element) => element == game),
                      key: ValueKey(game),
                      child: GestureDetector(
                        onTap: () => controller.openGame(game),
                        child: Container(
                          decoration: new BoxDecoration(
                              color: Theme.of(context).backgroundColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              )),
                          margin: const EdgeInsets.only(
                              top: 8.0, bottom: 8, left: 8, right: 15),
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: game.cover != null
                                        ? Hero(
                                            tag: "image${game.cover.id}",
                                            child: Image.network(
                                              game.cover.smallCover,
                                              fit: BoxFit.contain,
                                              loadingBuilder:
                                                  (BuildContext context,
                                                      Widget child,
                                                      ImageChunkEvent
                                                          loadingProgress) {
                                                if (loadingProgress == null)
                                                  return child;
                                                return CoverPlaceHolder();
                                              },
                                            ),
                                          )
                                        : CoverPlaceHolder()),
                              ),
                              Container(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      game.name,
                                      style: TextStyle(
                                          color: Theme.of(context).canvasColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Container(height: 10),
                                    Text(
                                      game.summary != null
                                          ? "${game.getShortSummary}..."
                                          : "",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Theme.of(context).canvasColor,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: controller.games.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
