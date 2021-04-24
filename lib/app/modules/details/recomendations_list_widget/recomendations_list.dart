import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/app/modules/details/details_controller.dart';
import 'package:project/app/modules/details/details_module.dart';
import 'package:project/shared/models/game_model.dart';

class RecomendationsList extends StatefulWidget {
  final DetailsController controller;
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
        return widget.games.length > 0
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    child: Text(widget.games.isNotEmpty ? widget.title : "",
                        style: TextStyle(
                          fontSize: 23,
                          color: Theme.of(context).canvasColor,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    width: double.infinity,
                    color: Theme.of(context).hintColor,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: widget.games
                              .map(
                                (Game game) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () async {
                                      await Modular.to.push(MaterialPageRoute(
                                          builder: (_) => DetailsModule(game: game)));
                                    }, //widget.controller.getgameInfo(game.id),
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
