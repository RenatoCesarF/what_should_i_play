import 'dart:ui';
import 'package:project/app/modules/details/ratingChart/ratingChart.dart';
import 'package:project/shared/components/recomendations_list.dart';
import 'package:project/shared/components/screenshotPlaceHolder.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/app/modules/details/details_controller.dart';
import 'package:project/app/modules/details/loading_details_page.dart';
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

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  final DetailsController controller = DetailsController();

  Future getGameData;

  @override
  void initState() {
    super.initState();
    getGameData = controller.getgameInfo(widget.game.id, context: context);
  }

  @override
  void dispose() {
    super.dispose();
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
                  body: Container(
                      child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        backgroundColor: Theme.of(context).dividerColor,
                        shadowColor: Colors.black,
                        elevation: 24,
                        centerTitle: true,
                        leadingWidth: 0,
                        automaticallyImplyLeading: false,
                        leading: Container(),
                        pinned: true,
                        expandedHeight: 168.0, //maybe 300
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 40,
                              child: TextButton(
                                // onLongPress: () =>
                                //     controller.backToDoYouMeanPage(),
                                onPressed: () => Modular.to.pop(),
                                child: Icon(Icons.arrow_back_rounded,
                                    size: 30,
                                    color: Theme.of(context)
                                        .accentColor), //changed
                              ),
                            ),
                            TextButton(
                              onPressed: () =>
                                  controller.addGameToFavorite(context),
                              child: Icon(
                                Icons.bookmark_border_outlined,
                                size: 30,
                                color: Theme.of(context).accentColor, //changed
                              ),
                            ),
                          ],
                        ),
                        flexibleSpace: FlexibleSpaceBar(
                          background: controller.gameInfo.screenshots != null
                              ? Container(
                                  color: Theme.of(context).backgroundColor,
                                  child: Stack(
                                    fit: StackFit.passthrough,
                                    children: [
                                      FadeInImage.memoryNetwork(
                                        fadeInDuration:
                                            Duration(milliseconds: 300),
                                        placeholder: kTransparentImage,
                                        image: controller
                                            .gameInfo
                                            .screenshots[0]
                                            .bigScreenshotImageURL,
                                        fit: BoxFit.fill,
                                      ),
                                      DecoratedBox(
                                          position:
                                              DecorationPosition.foreground,
                                          decoration: new BoxDecoration(
                                              //color: Colors.lightGreen
                                              gradient: new LinearGradient(
                                                  begin: FractionalOffset
                                                      .bottomCenter,
                                                  end: FractionalOffset
                                                      .topCenter,
                                                  colors: [
                                                Theme.of(context)
                                                    .backgroundColor,
                                                Color(0x0000000),
                                                Color(0x0000000),
                                              ])))
                                    ],
                                  ),
                                )
                              : Container(),
                          titlePadding: EdgeInsets.zero,
                          centerTitle: false,
                          title: Container(
                            margin: const EdgeInsets.only(
                                top: 30.0, left: 43, right: 43),
                            child: Center(
                              child: Text(
                                controller.gameInfo
                                    .name, //controller.gameInfo.name.length < 30 ? controller.gameInfo.name : "${controller.gameInfo.name.substring(0, 30)}...",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  shadows: [
                                    Shadow(
                                        // bottomLeft
                                        offset: Offset(-1, -1),
                                        color:
                                            Theme.of(context).backgroundColor),
                                    Shadow(
                                        // bottomRight
                                        offset: Offset(1, -1),
                                        color:
                                            Theme.of(context).backgroundColor),
                                    Shadow(
                                        // topRight
                                        offset: Offset(1, 1),
                                        color:
                                            Theme.of(context).backgroundColor),
                                    Shadow(
                                        // topLeft
                                        offset: Offset(-1, 1),
                                        color:
                                            Theme.of(context).backgroundColor),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.only(top: 20, bottom: 20),
                                    width: double.infinity,
                                    color: Theme.of(context).backgroundColor,
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          child: controller.gameInfo.cover !=
                                                  null
                                              ? Hero(
                                                  tag:
                                                      "cover${controller.gameInfo.cover.imageId}",
                                                  child: GestureDetector(
                                                      // onDoubleTap: () => Navigator.push(
                                                      //     context,
                                                      //     MaterialPageRoute(
                                                      //       builder: (context) => OpenedImage(
                                                      //         controller.gameInfo.cover.hd,
                                                      //         controller.gameInfo.cover.id,
                                                      //         rotate: false,
                                                      //         tag: "cover",
                                                      //       ),
                                                      //     )),
                                                      child: FadeInImage
                                                          .memoryNetwork(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 200),
                                                    placeholder:
                                                        kTransparentImage,
                                                    image: controller.gameInfo
                                                        .cover.bigCover,
                                                    height: 352,
                                                    width: 264,
                                                  )),
                                                )
                                              : CoverPlaceHolder(
                                                  scaleFactory: 1,
                                                ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                  controller.gameInfo
                                                              .launchYear !=
                                                          null
                                                      ? "${controller.gameInfo.launchYear}"
                                                      : "",
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .canvasColor,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(
                                                  controller
                                                              .gameInfo
                                                              .getDeveloperCompany
                                                              .name !=
                                                          null
                                                      ? " — ${controller.gameInfo.getDeveloperCompany.name}"
                                                      : "",
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .canvasColor,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  controller.gameInfo.getDeveloperCompany
                                              .logo !=
                                          null
                                      ? Positioned(
                                          bottom: 40,
                                          right: 30,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Container(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  padding: EdgeInsets.all(3),
                                                  child:
                                                      FadeInImage.memoryNetwork(
                                                    imageScale: 2.3,
                                                    fadeInDuration: Duration(
                                                        milliseconds: 200),
                                                    placeholder:
                                                        kTransparentImage,
                                                    image: controller
                                                        .gameInfo
                                                        .getDeveloperCompany
                                                        .logo
                                                        .getLogoMedURL,
                                                  ))))
                                      : Container()
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text("Summary: ",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color:
                                                  Theme.of(context).accentColor,
                                              fontWeight: FontWeight.w900)),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        print(controller.isSummaryExpanded);
                                        controller.isSummaryExpanded =
                                            !controller.isSummaryExpanded;
                                      },
                                      child: Stack(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 5, left: 10),
                                            child: Text(
                                              "\t${controller.isSummaryExpanded ? controller.gameInfo.summary : controller.gameInfo.getShortSummary}",
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .canvasColor,
                                                  fontSize: 15),
                                            ),
                                          ),
                                          Positioned(
                                              right: -5,
                                              bottom: -10,
                                              child: Icon(
                                                controller.isSummaryExpanded
                                                    ? Icons.expand_less_rounded
                                                    : Icons
                                                        .expand_more_outlined,
                                                color: Theme.of(context)
                                                    .accentColor,
                                                size: 30,
                                              ))
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 3, bottom: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              controller.gameInfo.genres != null
                                                  ? Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 5),
                                                            child: Text(
                                                                "Genres: ",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    color: Theme.of(
                                                                            context)
                                                                        .accentColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900))),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 7),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: controller
                                                                .gameInfo.genres
                                                                .map((genre) => Text(
                                                                    " ${genre.name},",
                                                                    style: TextStyle(
                                                                        color: Theme.of(context)
                                                                            .canvasColor,
                                                                        fontWeight:
                                                                            FontWeight.bold)))
                                                                .toList(),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                          controller.gameInfo.totalRating !=
                                                  null
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: SizedBox(
                                                      width: 100,
                                                      height: 100,
                                                      child: RatingChart(
                                                          controller)),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                    controller.gameInfo.platforms != null
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Platforms:",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Theme.of(context)
                                                          .accentColor,
                                                      fontWeight:
                                                          FontWeight.w900)),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 5, left: 8),
                                                child: Wrap(
                                                  runSpacing: 10,
                                                  spacing: 20,
                                                  children: controller
                                                      .gameInfo.platforms
                                                      .map((platform) => Text(
                                                          platform.name,
                                                          style: TextStyle(
                                                              color: Theme.of(
                                                                      context)
                                                                  .canvasColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)))
                                                      .toList(),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Container(),
                                    controller.gameInfo.websites != null
                                        ? WebsiteWrapList(
                                            controller.gameInfo.websites)
                                        : Container(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: controller.gameInfo.screenshots != null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    color: Theme.of(context).backgroundColor,
                                    width: double.infinity,
                                    padding: EdgeInsets.only(
                                        left: 10, top: 5, bottom: 5),
                                    child: Text("📷 Screenshots",
                                        style: TextStyle(
                                          fontSize: 26,
                                          color: Theme.of(context).canvasColor,
                                          fontWeight: FontWeight.w900,
                                        )),
                                  ),
                                  Container(
                                      height: 2,
                                      color: Theme.of(context).primaryColor),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    color: Theme.of(context).backgroundColor,
                                    height: 340,
                                    width: double.infinity,
                                    child: ListView.builder(
                                      itemCount: controller
                                          .gameInfo.screenshots.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        Screenshot image = controller
                                            .gameInfo.screenshots[index];

                                        return InteractiveViewer(
                                          child: GestureDetector(
                                            onDoubleTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        OpenedImage(
                                                            image
                                                                .bigScreenshotImageURL,
                                                            image.id,
                                                            tag:
                                                                "screenshot"))),
                                            child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                child: Hero(
                                                  tag: "screenshot${image.id}",
                                                  child: Image.network(
                                                    image.medScreenshotImageURL,
                                                    loadingBuilder: (BuildContext
                                                            context,
                                                        Widget child,
                                                        ImageChunkEvent
                                                            loadingProgress) {
                                                      if (loadingProgress ==
                                                          null) return child;
                                                      return ScreenshotPlaceHolder();
                                                    },
                                                  ),
                                                )),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              )
                            : Container(),
                      ),
                      SliverToBoxAdapter(
                        child: controller.gameInfo.artworks != null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    color: Theme.of(context).backgroundColor,
                                    width: double.infinity,
                                    padding: EdgeInsets.only(
                                        left: 10, top: 5, bottom: 5),
                                    child: Text("🖼️ Artworks",
                                        style: TextStyle(
                                          fontSize: 26,
                                          color: Theme.of(context).canvasColor,
                                          fontWeight: FontWeight.w900,
                                        )),
                                  ),
                                  Container(
                                      height: 2,
                                      color: Theme.of(context).primaryColor),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    color: Theme.of(context).backgroundColor,
                                    height: 340,
                                    width: double.infinity,
                                    child: ListView.builder(
                                      itemCount:
                                          controller.gameInfo.artworks.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        ArtWork image =
                                            controller.gameInfo.artworks[index];

                                        return InteractiveViewer(
                                          child: GestureDetector(
                                            onDoubleTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        OpenedImage(
                                                            image.bigImageURL,
                                                            image.id,
                                                            tag: "artworks"))),
                                            child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                child: Hero(
                                                  tag: "artworks${image.id}",
                                                  child: Image.network(
                                                    image.medImageURL,
                                                    loadingBuilder: (BuildContext
                                                            context,
                                                        Widget child,
                                                        ImageChunkEvent
                                                            loadingProgress) {
                                                      if (loadingProgress ==
                                                          null) return child;
                                                      return ScreenshotPlaceHolder();
                                                    },
                                                  ),
                                                )),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              )
                            : Container(),
                      ),
                      SliverToBoxAdapter(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 2,
                                color: Theme.of(context).backgroundColor),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 10, top: 5, bottom: 5),
                              child: Text("Recomendations",
                                  style: TextStyle(
                                    fontSize: 33,
                                    color: Theme.of(context).canvasColor,
                                    fontWeight: FontWeight.w900,
                                  )),
                            ),
                            RecomendationsList(
                              controller.gamesFromTheSameDevelopers,
                              "From the same Developers",
                            ),
                            RecomendationsList(
                              controller.similarGames,
                              "Similar ones",
                            ),
                            Container(height: 20),
                          ],
                        ),
                      ))
                    ],
                  )));
            },
          );
        });
  }
}
