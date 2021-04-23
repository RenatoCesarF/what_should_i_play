import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/app/modules/details/details_module.dart';
import 'package:project/shared/models/game_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

part 'do_you_mean_controller.g.dart';

@Injectable()
class DoYouMeanController = _DoYouMeanControllerBase with _$DoYouMeanController;

abstract class _DoYouMeanControllerBase with Store {
  @observable
  TextEditingController searchBarController = TextEditingController();

  @observable
  ObservableList<Game> games = ObservableList.of([]);

  @observable
  bool finishSearch = false;

  @action
  Future<void> findGames(String gameName) async {
    gameName = "god of war";
    finishSearch = false;
    games.clear();
    List response = await Dio()
        .post("https://api.igdb.com/v4/games/",
            data:
                'search "$gameName"; limit 29;fields name,cover.image_id,summary,screenshots,first_release_date,genres.name,platforms.name,total_rating, involved_companies.company.name,involved_companies.developer;',
            options: Options(headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/x-www-form-urlencoded',
              'Client-ID': env["CLIENT_ID"],
              'Authorization': env["AUTHORIZATION"],
            }))
        .then((value) => value.data) as List;
    // print(response);

    response.forEach((element) {
      Game game = Game.fromJson(element);

      games.add(game);
    });
    // print("The size of the list is ${games.length}");

    finishSearch = true;
    return;
  }

  @action
  Future<void> openGame(Game game) async {
    await Modular.to.push(MaterialPageRoute(builder: (_) => DetailsModule(game: game)));
    // await Navigator.push(context,
  }
}
