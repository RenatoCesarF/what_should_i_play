import 'dart:ui';
import 'package:project/shared/components/recomendations_list.dart';
import 'package:project/shared/components/screenshotPlaceHolder.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/app/modules/details/details_controller.dart';
import 'package:project/app/modules/details/loading_details_page.dart';
import 'package:project/app/modules/details/ratingChart/ratingChart.dart';
import 'package:project/shared/components/coverPlaceHolder.dart';
import 'package:project/shared/components/website_widget.dart';
import 'package:project/shared/models/game_model.dart';

import '../../../shared/components/open_image.dart';

class DetailsPage extends StatefulWidget {
  final Game game;

  const DetailsPage(this.game, {Key key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> with SingleTickerProviderStateMixin {
  final DetailsController controller = DetailsController();

  Future getGameData;

  @override
  void initState() {
    super.initState();
    getGameData = controller.getgameInfo(widget.game.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getGameData,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return LoadingDetailsPage();
          }

          return Observer(
            builder: (BuildContext context) {
              return Scaffold(
                  backgroundColor: Theme.of(context).primaryColor,
                  body: Column(
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
                                    // onLongPress: () =>
                                    //     controller.backToDoYouMeanPage(),
                                    onPressed: () => Modular.to.pop(),
                                    child: Icon(Icons.arrow_back_rounded, size: 30, color: Theme.of(context).accentColor), //changed
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      controller.gameInfo.name,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Theme.of(context).canvasColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: controller.addGameToFavorite,
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
                            color: Theme.of(context).backgroundColor,
                          )
                        ],
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: ExpansionPanelList(
                              dividerColor: Theme.of(context).primaryColor,
                              expansionCallback: (int index, bool isExpanded) {
                                if (index == 0) {
                                  controller.onTapDetailsPanel();
                                  return;
                                }
                                if (index == 1) {
                                  controller.onTapScreenshotsPanel();
                                  return;
                                }
                                if (index == 2) {
                                  controller.onTapRecomendationsPanel();
                                  return;
                                }
                              },
                              children: [
                                ExpansionPanel(
                                  canTapOnHeader: true,
                                  backgroundColor: Theme.of(context).primaryColor,
                                  headerBuilder: (BuildContext context, bool isExpanded) {
                                    return ListTile(
                                        onTap: controller.onTapDetailsPanel, title: Text("Details", textAlign: TextAlign.left, style: Theme.of(context).textTheme.headline1));
                                  },
                                  isExpanded: controller.isInfoExpanded,
                                  body: Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(top: 20, bottom: 20),
                                              width: double.infinity,
                                              color: Theme.of(context).backgroundColor,
                                              child: Column(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius: BorderRadius.circular(18.0),
                                                    child: controller.gameInfo.cover != null
                                                        ? Hero(
                                                            tag: "image${controller.gameInfo.cover.id}",
                                                            child: GestureDetector(
                                                                onDoubleTap: () => Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            OpenedImage(controller.gameInfo.cover.hd, controller.gameInfo.cover.id, rotate: false))),
                                                                child: FadeInImage.memoryNetwork(
                                                                  fadeInDuration: Duration(milliseconds: 200),
                                                                  placeholder: kTransparentImage,
                                                                  image: controller.gameInfo.cover.bigCover,
                                                                  height: 352,
                                                                  width: 264,
                                                                )
                                                                // child:
                                                                //     Image.network(
                                                                //   controller
                                                                //       .gameInfo
                                                                //       .cover
                                                                //       .bigCover,
                                                                //   loadingBuilder: (BuildContext
                                                                //           context,
                                                                //       Widget
                                                                //           child,
                                                                //       ImageChunkEvent
                                                                //           loadingProgress) {
                                                                //     if (loadingProgress ==
                                                                //         null)
                                                                //       return child;
                                                                //     return CoverPlaceHolder(
                                                                //       scaleFactory:
                                                                //           1,
                                                                //     );
                                                                //   },
                                                                //   height: 352,
                                                                //   width: 264,
                                                                // ),
                                                                ),
                                                          )
                                                        : CoverPlaceHolder(
                                                            scaleFactory: 1,
                                                          ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(top: 15),
                                                    child: Text("${controller.gameInfo.launchYear} — ${controller.gameInfo.getDeveloperCompany.name}",
                                                        style: TextStyle(color: Theme.of(context).canvasColor, fontWeight: FontWeight.bold)),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                                bottom: 40,
                                                right: 30,
                                                child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(8.0),
                                                    child: controller.gameInfo.getDeveloperCompany.logo != null
                                                        ? FadeInImage.memoryNetwork(
                                                            imageScale: 2.3,
                                                            fadeInDuration: Duration(milliseconds: 200),
                                                            placeholder: kTransparentImage,
                                                            image: controller.gameInfo.getDeveloperCompany.logo.getLogoMedURL,
                                                          )
                                                        : Container()))
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(horizontal: 20),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(top: 10),
                                                child: Text("Summary: ", style: TextStyle(fontSize: 16, color: Theme.of(context).accentColor, fontWeight: FontWeight.w900)),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  controller.isSummaryExpanded = !controller.isSummaryExpanded;
                                                },
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(top: 5, left: 10),
                                                      child: Text(
                                                        "\t${controller.isSummaryExpanded ? controller.gameInfo.summary : controller.gameInfo.getShortSummary}",
                                                        textAlign: TextAlign.justify,
                                                        style: TextStyle(color: Theme.of(context).canvasColor, fontSize: 15),
                                                      ),
                                                    ),
                                                    Positioned(
                                                        right: -5,
                                                        bottom: -10,
                                                        child: Icon(
                                                          controller.isSummaryExpanded ? Icons.expand_less_rounded : Icons.expand_more_outlined,
                                                          color: Theme.of(context).accentColor,
                                                          size: 30,
                                                        ))
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 3, bottom: 20),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        controller.gameInfo.genres != null
                                                            ? Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Container(
                                                                      margin: EdgeInsets.only(top: 5),
                                                                      child: Text("Genres: ",
                                                                          style: TextStyle(fontSize: 16, color: Theme.of(context).accentColor, fontWeight: FontWeight.w900))),
                                                                  Container(
                                                                    margin: EdgeInsets.only(left: 7),
                                                                    child: Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: controller.gameInfo.genres
                                                                          .map((genre) => Text(" ${genre.name},",
                                                                              style: TextStyle(color: Theme.of(context).canvasColor, fontWeight: FontWeight.bold)))
                                                                          .toList(),
                                                                    ),
                                                                  ),
                                                                ],
                                                              )
                                                            : Container(),
                                                      ],
                                                    ),
                                                    controller.gameInfo.totalRating != null
                                                        ? Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: SizedBox(width: 100, height: 100, child: RatingChart(controller)),
                                                          )
                                                        : Container(),
                                                  ],
                                                ),
                                              ),
                                              controller.gameInfo.platforms != null
                                                  ? Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Platforms:", style: TextStyle(fontSize: 16, color: Theme.of(context).accentColor, fontWeight: FontWeight.w900)),
                                                        Container(
                                                          margin: EdgeInsets.only(top: 5, left: 8),
                                                          child: Wrap(
                                                            runSpacing: 10,
                                                            spacing: 20,
                                                            children: controller.gameInfo.platforms
                                                                .map((platform) =>
                                                                    Text(platform.name, style: TextStyle(color: Theme.of(context).canvasColor, fontWeight: FontWeight.bold)))
                                                                .toList(),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : Container(),
                                              controller.gameInfo.websites != null ? WebsiteWrapList(controller.gameInfo.websites) : Container(),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                ExpansionPanel(
                                  backgroundColor: Theme.of(context).primaryColor,
                                  headerBuilder: (BuildContext context, bool isExpanded) {
                                    return ListTile(
                                        onTap: controller.onTapScreenshotsPanel,
                                        title: Text("Screenshots", textAlign: TextAlign.left, style: Theme.of(context).textTheme.headline1));
                                  },
                                  isExpanded: controller.isScreenshotsExpanded,
                                  body: controller.gameInfo.screenshots != null
                                      ? Container(
                                          padding: EdgeInsets.symmetric(vertical: 10),
                                          color: Theme.of(context).backgroundColor,
                                          height: 350,
                                          width: double.infinity,
                                          child: ListView.builder(
                                            itemCount: controller.gameInfo.screenshots.length,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (BuildContext context, int index) {
                                              Screenshot image = controller.gameInfo.screenshots[index];

                                              return InteractiveViewer(
                                                child: GestureDetector(
                                                  onDoubleTap: () =>
                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => OpenedImage(image.bigScreenshotImageURL, image.id))),
                                                  child: Container(
                                                      margin: EdgeInsets.symmetric(horizontal: 10),
                                                      child: Hero(
                                                        transitionOnUserGestures: true,
                                                        tag: "image${image.id}",
                                                        child: Image.network(
                                                          image.medScreenshotImageURL,
                                                          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
                                                            if (loadingProgress == null) return child;
                                                            return ScreenshotPlaceHolder();
                                                          },
                                                        ),
                                                      )),
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      : Container(),
                                ),
                                ExpansionPanel(
                                    backgroundColor: Theme.of(context).primaryColor,
                                    headerBuilder: (BuildContext context, bool isExpanded) {
                                      return ListTile(
                                          onTap: controller.onTapRecomendationsPanel,
                                          title: Text("Recomendations", textAlign: TextAlign.left, style: Theme.of(context).textTheme.headline1));
                                    },
                                    isExpanded: controller.isRecomendationsExpanded,
                                    body: Column(
                                      children: [
                                        RecomendationsList(
                                          controller.gamesFromTheSameDevelopers,
                                          "From the same Developers",
                                        ),
                                        RecomendationsList(controller.similarGames, "Similar ones"),
                                        Container(height: 20),
                                      ],
                                    )),
                              ]),
                        ),
                      ),
                    ],
                  ));
            },
          );
        });
  }
}
