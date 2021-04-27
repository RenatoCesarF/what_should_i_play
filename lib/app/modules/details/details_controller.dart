import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobx/mobx.dart';
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
  bool isSummaryExpanded = false;

  @observable
  ObservableList<Game> sameCompany = ObservableList.of([]);

  @observable
  ObservableList<Game> similarGames = ObservableList.of([]);

  @observable
  Game gameInfo;

  @action
  Future<void> getgameInfo(int gameId) async {
    isInfoExpanded = true;
    similarGames.clear();
    sameCompany.clear();

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

    _getSameCompanyGames(gameInfo);

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

  void _getSameCompanyGames(Game game) {
    Company developerCompany = game.getDeveloperCompany;

    if (developerCompany.developed != null) {
      developerCompany.developed.forEach((eachGame) {
        if (eachGame.id == game.id) return;
        sameCompany.add(eachGame);
      });
    }

    if (developerCompany.published != null) {
      developerCompany.published.forEach((eachGame) {
        if (eachGame.id == game.id) return;
        sameCompany.add(eachGame);
      });
    }
  }

  void _getSimilarGames(Game game) {
    if (gameInfo.similarGames != null) {
      gameInfo.similarGames.forEach((game) {
        similarGames.add(game);
      });
    }
  }

  @action
  void onTapRecomendationsPanel() {
    isRecomendationsExpanded = !isRecomendationsExpanded;
  }

  @action
  void onTapInfoPanel() {
    isInfoExpanded = !isInfoExpanded;
  }
}
