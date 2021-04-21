import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:project/app/modules/recomendations/recomendations_controller.dart';
import 'package:project/shared/models/game_model.dart';

class RecomendationsList extends StatefulWidget {
  final RecomendationsController controller;
  final List<Game> games;
  final String title;

  RecomendationsList(this.controller, this.games, this.title);

  @override
  _RecomendationsListState createState() => _RecomendationsListState();
}

class _RecomendationsListState extends State<RecomendationsList> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return widget.games.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    child: Text(widget.games.isNotEmpty ? widget.title : "",
                        style: TextStyle(
                          fontSize: 23,
                          color: Color(0xff979797),
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    color: Color(0xff1F1A38),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: widget.games
                              .map(
                                (game) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                        game.cover != null
                                            ? game.cover.bigCover
                                            : "https://via.placeholder.com/264x374",
                                        scale: 2,
                                        fit: BoxFit.contain),
                                  ),
                                ),
                              )
                              .toList()),
                    ),
                  ),
                ],
              )
            : Container();
      },
    );
  }
}
