import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/app/modules/recomendations/recomendations_controller.dart';
import 'package:project/app/modules/search/search_controller.dart';
import 'package:project/shared/components/loading.dart';
import 'package:project/shared/models/game_model.dart';

class RecomendationsPage extends StatefulWidget {
  final String title;
  final Game game;
  const RecomendationsPage({Key key, this.title = "DoYouMean", this.game}) : super(key: key);

  @override
  _RecomendationsPageState createState() => _RecomendationsPageState();
}

class _RecomendationsPageState extends State<RecomendationsPage>
    with SingleTickerProviderStateMixin {
  final RecomendationsController controller = RecomendationsController();

  @override
  void initState() {
    super.initState();
    controller.getRecomendedGames(widget.game.id);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return Scaffold(
            backgroundColor: Color(0xff322A5C),
            body: controller.finishLoad
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            color: Color(0xff322A5C),
                            padding: EdgeInsets.only(top: 30, bottom: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 40,
                                  child: TextButton(
                                    onPressed: () => Modular.to.pop(),
                                    child: Icon(Icons.arrow_back_rounded,
                                        size: 30, color: Color(0xffF21B3F)),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      controller.recomendedGames.name,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff979797), // Color(0xffF21B3F)
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      print("on click this, save the game in favorites"),
                                  child: Icon(
                                    Icons.bookmark_border_outlined,
                                    size: 30,
                                    color: Color(0xffF21B3F),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 3,
                            color: Color(0xff1F1A38),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 10, bottom: 30),
                        child: Text("Recomendations",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 25,
                              color: Color(0xff979797),
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Text("From the same Company",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff979797),
                            fontWeight: FontWeight.bold,
                          )),
                      //Vertical List View
                      Expanded(
                        child: ListView(
                          children: [
                            //Horizontal List View
                            controller.sameCompany.isNotEmpty || controller.sameCompany != null
                                ? Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    color: Color(0xff1F1A38),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                          children: controller.sameCompany
                                              .map(
                                                (gameFromCompany) => Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(8.0),
                                                    child: Image.network(
                                                        gameFromCompany != null
                                                            ? gameFromCompany.cover.bigCover
                                                            : "https://via.placeholder.com/264x374",
                                                        scale: 2,
                                                        fit: BoxFit.contain),
                                                  ),
                                                ),
                                              )
                                              .toList()),
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    ],
                  )
                : Loading());
      },
    );
  }
}
