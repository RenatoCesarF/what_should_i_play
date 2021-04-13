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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: [
              Image.network("https://via.placeholder.com/150"),
              Text("Nome do jogo"),
            ],
          )
        ],
      ),
    );
  }
}
