import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/app/modules/details/details_controller.dart';
import 'package:project/app/modules/details/recomendations_list_widget/recomendations_list.dart';
import 'package:project/app/modules/search/search_controller.dart';
import 'package:project/shared/components/loading.dart';
import 'package:project/shared/models/game_model.dart';

class DetailsPage extends StatefulWidget {
  final String title;
  final Game game;
  const DetailsPage({Key key, this.title = "DoYouMean", this.game}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> with SingleTickerProviderStateMixin {
  final DetailsController controller = DetailsController();

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
            backgroundColor: Theme.of(context).primaryColor,
            body: controller.finishLoad
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            color: Theme.of(context).primaryColor,
                            padding: EdgeInsets.only(top: 30, bottom: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 40,
                                  child: TextButton(
                                    onPressed: () => Modular.to.pop(),
                                    child: Icon(Icons.arrow_back_rounded,
                                        size: 30, color: Theme.of(context).accentColor), //changed
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      controller.recomendedGames.game.name,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff979797),
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
                                    color: Theme.of(context).accentColor, //changed
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 3,
                            color: Theme.of(context).hintColor,
                          )
                        ],
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: ExpansionPanelList(
                              dividerColor: Theme.of(context).primaryColor,
                              expansionCallback: (int index, bool isExpanded) =>
                                  controller.onTapInfoPanel,
                              children: [
                                ExpansionPanel(
                                    backgroundColor: Theme.of(context).primaryColor,
                                    headerBuilder: (BuildContext context, bool isExpanded) {
                                      return ListTile(
                                          onTap: controller.onTapInfoPanel,
                                          title: Text("Details",
                                              textAlign: TextAlign.left,
                                              style: Theme.of(context).textTheme.headline1));
                                    },
                                    isExpanded: controller.isInfoExpanded,
                                    body: Column(
                                      children: [
                                        Image.network(
                                            controller.recomendedGames.game.cover.bigCover)
                                      ],
                                    )),
                                ExpansionPanel(
                                    backgroundColor: Theme.of(context).primaryColor,
                                    headerBuilder: (BuildContext context, bool isExpanded) {
                                      return ListTile(
                                          onTap: controller.onTapRecomendationsPanel,
                                          title: Text("Recomendations",
                                              textAlign: TextAlign.left,
                                              style: Theme.of(context).textTheme.headline1));
                                    },
                                    isExpanded: controller.isRecomendationsExpanded,
                                    body: Column(
                                      children: [
                                        //Same Company
                                        RecomendationsList(controller, controller.sameCompany,
                                            "From the same Company"),

                                        //Similar games
                                        RecomendationsList(
                                            controller, controller.similarGames, "Similar ones")
                                      ],
                                    )),
                              ]),
                        ),
                      )
                    ],
                  )
                : Loading());
      },
    );
  }
}

/*
Expanded(child:
 SingleChildScrollView(
                        child: ExpansionPanelList(
                            dividerColor: Theme.of(context).primaryColor,
                            expansionCallback: (int index, bool isExpanded) {
                              controller.isRecomendationsExpanded =
                                  !controller.isRecomendationsExpanded;
                            },
                            children: [
                              ExpansionPanel(
                                  backgroundColor: Theme.of(context).primaryColor,
                                  headerBuilder: (BuildContext context, bool isExpanded) {
                                    return ListTile(
                                        onTap: () {
                                          controller.isRecomendationsExpanded =
                                              !controller.isRecomendationsExpanded;
                                        },
                                        hoverColor: Colors.blue,
                                        focusColor: Colors.red,
                                        title: Text("Titulo",
                                            textAlign: TextAlign.left,
                                            style: Theme.of(context).textTheme.headline1));
                                  },
                                  isExpanded: controller.isRecomendationsExpanded,
                                  body: Column(
                                    children: [
                                      Image.network(controller.recomendedGames.game.cover.bigCover)
                                    ],
                                  )),
                              ExpansionPanel(
                                  backgroundColor: Theme.of(context).primaryColor,
                                  headerBuilder: (BuildContext context, bool isExpanded) {
                                    return ListTile(
                                        onTap: () {
                                          controller.isRecomendationsExpanded =
                                              !controller.isRecomendationsExpanded;
                                        },
                                        hoverColor: Colors.blue,
                                        focusColor: Colors.red,
                                        title: Text("Recomendations",
                                            textAlign: TextAlign.left,
                                            style: Theme.of(context).textTheme.headline1));
                                  },
                                  isExpanded: controller.isRecomendationsExpanded,
                                  body: Column(
                                    children: [
                                      //Same Company
                                      RecomendationsList(controller, controller.sameCompany,
                                          "From the same Company"),

                                      //Similar games
                                      RecomendationsList(
                                          controller, controller.similarGames, "Similar ones")
                                    ],
                                  )),
                            ]),
                      ),)
*/
