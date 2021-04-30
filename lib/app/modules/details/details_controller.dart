import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:project/app/modules/details/details_module.dart';
import 'package:project/app/modules/doYouMean/do_you_mean_page.dart';
import 'package:project/shared/models/company_model.dart';
import 'package:project/shared/models/game_model.dart';

part 'details_controller.g.dart';

class DetailsController = _DetailsControllerBase with _$DetailsController;

abstract class _DetailsControllerBase with Store {
  @observable
  bool finishLoad = false;

  @observable
  bool isRecomendationsExpanded = false;

  @observable
  bool isInfoExpanded = true;

  @observable
  bool isScreenshotsExpanded = true;

  @observable
  bool isSummaryExpanded = false;

  @observable
  ObservableList<Game> gamesFromTheSameCompany = ObservableList.of([]);

  @observable
  ObservableList<Game> similarGames = ObservableList.of([]);

  @observable
  Game gameInfo;

  @action
  Future<void> getgameInfo(int gameId) async {
    isInfoExpanded = true;
    similarGames.clear();
    gamesFromTheSameCompany.clear();

    finishLoad = false;
    var response = await Dio()
        .post("https://api.igdb.com/v4/games",
            data: _getRequestData(gameId),
            options: Options(headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/x-www-form-urlencoded',
              'Client-ID': env["CLIENT_ID"],
              'Authorization': env["AUTHORIZATION"],
            }))
        .then((value) => value.data);

    // print(response);
    gameInfo = Game.fromJson(response[0]);

    _getgamesFromTheSameCompanyGames(gameInfo);

    _getSimilarGames(gameInfo);

    finishLoad = true;
  }

  String _getRequestData(int gameId) {
    String requestData = 'where id = $gameId; fields ';
    final List<String> eachField = [
      'name',
      'summary',
      'total_rating',
      'first_release_date',
      'genres.name',
      'cover.image_id',
      'screenshots',
      'screenshots.image_id',
      'websites.url',
      'websites.category',
      'platforms.name',
      'platforms.platform_logo.image_id',
      'similar_games.cover.image_id',
      'similar_games.name',
      'involved_companies.developer',
      'involved_companies.company.name',
      'involved_companies.company.published.cover.image_id',
      'involved_companies.company.published.name',
      'involved_companies.company.developed.cover.image_id',
      'involved_companies.company.developed.name',
      'involved_companies.company.logo.image_id',
    ];

    requestData += eachField.join(',');
    requestData += ';';

    return requestData;
  }

  void _getgamesFromTheSameCompanyGames(Game game) {
    Company developerCompany = game.getDeveloperCompany;

    if (developerCompany.developed != null) {
      developerCompany.developed.forEach((eachGame) {
        if (eachGame.id == game.id) return;
        gamesFromTheSameCompany.add(eachGame);
      });
    }

    if (developerCompany.published != null) {
      developerCompany.published.forEach((eachGame) {
        if (eachGame.id == game.id) return;
        gamesFromTheSameCompany.add(eachGame);
      });
    }
  }

  void _getSimilarGames(Game game) {
    if (gameInfo.similarGames != null) {
      gameInfo.similarGames.forEach((game) {
        _gameWasAlredyListed(game) ? print("") : similarGames.add(game);
      });
    }
  }

  bool _gameWasAlredyListed(comparedGame) {
    bool gameAlreadyListed = false;

    gamesFromTheSameCompany.forEach((gameOfCompany) {
      if (gameOfCompany.id != comparedGame.id) {
        return;
      }
      gameAlreadyListed = true;
      return;
    });

    return gameAlreadyListed;
  }

  @action
  void onTapRecomendationsPanel() {
    isRecomendationsExpanded = !isRecomendationsExpanded;
  }

  @action
  void onTapScreenshotsPanel() {
    isScreenshotsExpanded = !isScreenshotsExpanded;
  }

  @action
  void onTapInfoPanel() {
    isInfoExpanded = !isInfoExpanded;
  }

  @action
  void backToDoYouMeanPage() async {
    await Modular.to.push(MaterialPageRoute(builder: (_) => DoYouMeanPage()));
  }
}
