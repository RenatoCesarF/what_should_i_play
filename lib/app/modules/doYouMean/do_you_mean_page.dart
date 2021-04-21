import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/shared/components/loading.dart';
import 'do_you_mean_controller.dart';

class DoYouMeanPage extends StatefulWidget {
  final String gameName;
  const DoYouMeanPage({Key key, this.gameName}) : super(key: key);

  @override
  _DoYouMeanPageState createState() => _DoYouMeanPageState();
}

class _DoYouMeanPageState extends ModularState<DoYouMeanPage, DoYouMeanController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    super.initState();
    controller.searchBarController.text = widget.gameName;
    controller.findGames(widget.gameName);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Stack(children: [
            controller.finishSearch
                ? controller.games.isEmpty || controller.games == null
                    ? Center(
                        child: Text(
                        "Couldn't Find ${widget.gameName.isEmpty ? controller.searchBarController.text : widget.gameName} ...",
                        style: TextStyle(
                            color: Color(0xff979797), fontWeight: FontWeight.bold, fontSize: 18),
                      ))
                    : ListView(
                        shrinkWrap: true,
                        addAutomaticKeepAlives: false,
                        children: controller.games
                            .map((game) => game != null
                                ? GestureDetector(
                                    onTap: () => controller.openGame(game),
                                    child: Dismissible(
                                      onDismissed: (key) => controller.games
                                          .removeWhere((element) => element == game),
                                      key: ValueKey(game),
                                      child: Container(
                                        decoration: new BoxDecoration(
                                            color: Color(0xff1F1A38),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20.0),
                                            )),
                                        margin: const EdgeInsets.all(8.0),
                                        padding: const EdgeInsets.all(8),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(8.0),
                                                child: Image.network(
                                                    game.cover != null
                                                        ? game.cover.smallCover
                                                        : "https://via.placeholder.com/90x128",
                                                    fit: BoxFit.contain),
                                              ),
                                            ),
                                            Container(width: 8),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    game.name,
                                                    style: TextStyle(
                                                        color: Color(0xff979797),
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                  Container(height: 10),
                                                  Text(
                                                    game.summary != null
                                                        ? "${game.summaryShort}..."
                                                        : "",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        color: Color(0xff979797), fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : Container())
                            .toList())
                : Loading(),
            Positioned(
                child: Column(
              children: [
                Container(
                  color: Theme.of(context).primaryColor,
                  padding: EdgeInsets.only(top: 30, bottom: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 40,
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Icon(Icons.arrow_back_rounded,
                              size: 30, color: Theme.of(context).accentColor), //changed
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          onEditingComplete: () =>
                              controller.findGames(controller.searchBarController.text),
                          controller: controller.searchBarController,
                          onChanged: (value) {
                            controller.searchBarController.text = value;
                          },
                          decoration: InputDecoration(
                              isDense: true,
                              hintText: "A game that you have enjoyed",
                              hintStyle: TextStyle(color: Color(0x66979797))),
                          autocorrect: false,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          selectionHeightStyle: BoxHeightStyle.tight,
                          textAlign: TextAlign.center,
                          cursorColor: Theme.of(context).accentColor, //changed
                        ),
                      ),
                      SizedBox(
                        width: 40,
                        child: TextButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            controller.findGames(controller.searchBarController.text);
                          },
                          child: Icon(
                            Icons.search_rounded,
                            size: 30,
                            color: Theme.of(context).accentColor, //changed
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 3,
                  color: Color(0xff1F1A38),
                ),
              ],
            )),
          ]),
        );
      },
    );
  }
}
