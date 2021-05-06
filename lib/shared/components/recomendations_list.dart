import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/app/modules/details/details_module.dart';
import 'package:project/shared/components/coverPlaceHolder.dart';
import 'package:project/shared/components/screenshotPlaceHolder.dart';
import 'package:project/shared/models/game_model.dart';

class RecomendationsList extends StatefulWidget {
  final List<Game> games;
  final String title;

  RecomendationsList(this.games, this.title);

  @override
  _RecomendationsListState createState() => _RecomendationsListState();
}

class _RecomendationsListState extends State<RecomendationsList> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return widget.games.length > 0
            ? Container(
                margin: EdgeInsets.only(bottom: 15),
                color: Theme.of(context).backgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8, top: 5, bottom: 3),
                      child: Text(widget.games.isNotEmpty ? widget.title : "",
                          style: TextStyle(
                            fontSize: 23,
                            color: Theme.of(context).canvasColor,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Container(height: 2, color: Theme.of(context).primaryColor),
                    Container(
                        padding: EdgeInsets.only(bottom: 8),
                        width: double.infinity,
                        height: 200,
                        color: Theme.of(context).backgroundColor,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.games.length,
                            itemBuilder: (BuildContext context, int index) {
                              Game game = widget.games[index];

                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () async {
                                    await Modular.to.push(MaterialPageRoute(builder: (_) => DetailsModule(game)));
                                  },
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: game.cover != null
                                          ? Hero(
                                              tag: 'image${game.cover.id}',
                                              child: Image.network(game.cover.bigCover, loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
                                                if (loadingProgress == null) return child;
                                                return CoverPlaceHolder(scaleFactory: 0.5);
                                              }, scale: 2, fit: BoxFit.contain),
                                            )
                                          : CoverPlaceHolder(
                                              scaleFactory: 0.5,
                                              gameName: game.name,
                                            )),
                                ),
                              );
                            })),
                  ],
                ),
              )
            : Container();
      },
    );
  }
}
