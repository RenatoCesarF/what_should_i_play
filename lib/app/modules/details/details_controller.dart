import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:project/shared/models/game_model.dart';
import 'package:project/shared/models/recomendations_model.dart';

part 'details_controller.g.dart';

class DetailsController = _DetailsControllerBase with _$DetailsController;

abstract class _DetailsControllerBase with Store {
  @observable
  bool finishLoad = false;

  @observable
  ObservableList<Game> sameCompany = ObservableList.of([]);

  @observable
  ObservableList<Game> similarGames = ObservableList.of([]);

  @observable
  Recomendations recomendedGames;

  @action
  Future<void> getRecomendedGames(int gameId) async {
    similarGames.clear();
    sameCompany.clear();

    finishLoad = false;
    var response = await Dio()
        .post("https://api.igdb.com/v4/games",
            data:
                'where id = $gameId;fields name,websites,summary,cover.image_id,first_release_date, genres.name,platforms.name,total_rating,name,franchises.games.name,franchises.games.cover.image_id, similar_games.cover.image_id, similar_games.name, involved_companies.company.published.cover.image_id, involved_companies.company.name, involved_companies.developer, involved_companies.company.published.name;', //$gameName
            options: Options(headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/x-www-form-urlencoded',
              'Client-ID': env["CLIENT_ID"],
              'Authorization': env["AUTHORIZATION"],
            }))
        .then((value) => value.data);

    // print(response);
    // TODO: add in model [ websites, sumarry,cover.image_id]
    recomendedGames = Recomendations.fromJson(response[0]);

    //USE
    //Same company
    recomendedGames.involvedCompanies
        .where((element) => element.developer == true)
        .forEach((element) {
      if (element.company.published == null) return;
      element.company.published.forEach((game) {
        if (game.id == gameId) return;
        sameCompany.add(game);
      });
    });

    //Similar Games
    recomendedGames.similarGames.forEach((game) {
      similarGames.add(game);
    });

    finishLoad = true;
  }
}
