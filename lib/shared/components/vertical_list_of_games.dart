import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/app/modules/details/details_module.dart';
import 'package:project/shared/models/game_model.dart';
import 'package:transparent_image/transparent_image.dart';

import 'coverPlaceHolder.dart';

class SliverVerticalGameList extends StatefulWidget {
  final List<Game> games;

  SliverVerticalGameList({@required this.games});

  @override
  _SliverVerticalGameListState createState() => _SliverVerticalGameListState();
}

class _SliverVerticalGameListState extends State<SliverVerticalGameList> {
  @override
  Widget build(BuildContext context) {
    return widget.games.length > 0
        ? SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                Game game = widget.games[index];

                if (game == null) {
                  return Container();
                }
                return GestureDetector(
                  onTap: () async => {
                    await Modular.to.push(
                        MaterialPageRoute(builder: (_) => DetailsModule(game)))
                  },
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
                                      tag: "cover${game.cover.imageId}",
                                      child: FadeInImage.memoryNetwork(
                                        fadeInDuration:
                                            Duration(milliseconds: 200),
                                        image: game.cover.smallCover,
                                        fit: BoxFit.contain,
                                        height: 120,
                                        width: 90,
                                        placeholder: kTransparentImage,
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
                );
              },
              childCount: widget.games.length,
            ),
          )
        : SliverToBoxAdapter(
            child: Container(
                padding: EdgeInsets.only(top: 140),
                child: Center(
                    child: Text("Could't Find this Game...",
                        style: TextStyle(
                          fontSize: 25,
                          color: Theme.of(context).canvasColor,
                          fontWeight: FontWeight.w900,
                        )))),
          );
  }
}
