import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'do_you_mean_controller.dart';

class DoYouMeanPage extends StatefulWidget {
  final String title;
  final String gameName;
  const DoYouMeanPage({Key key, this.title = "DoYouMean", this.gameName}) : super(key: key);

  @override
  _DoYouMeanPageState createState() => _DoYouMeanPageState();
}

class _DoYouMeanPageState extends ModularState<DoYouMeanPage, DoYouMeanController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    super.initState();
    controller.findGames(widget.gameName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff322A5C),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: controller.games.isNotEmpty
            ? ListView(
                children: controller.games
                    .map((game) => Container(
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
                                      "https://images.igdb.com/igdb/image/upload/t_cover_small/${game.cover.imageId}.jpg",
                                      fit: BoxFit.contain),
                                ),
                              ),
                              Container(width: 8),
                              Expanded(
                                child: Column(
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
                                          ? "${game.summary.substring(0, 80)}..."
                                          : "",
                                      style: TextStyle(color: Color(0xff979797), fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ))
                    .toList())
            : CircularProgressIndicator());
  }
}
