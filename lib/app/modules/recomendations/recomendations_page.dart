import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/app/modules/recomendations/recomendations_controller.dart';
import 'package:project/app/modules/search/search_controller.dart';
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
    controller.test();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff322A5C),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: ListView(
              children: [],
            ),
          ),
          Positioned(
              child: Column(
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
                        child: Icon(Icons.arrow_back_rounded, size: 30, color: Color(0xffF21B3F)),
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () => print("on click this, save the game in favorites"),
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
          )),
        ],
      ),
    );
  }
}
