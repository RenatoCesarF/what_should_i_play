import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/app/modules/details/details_module.dart';
import 'package:project/shared/models/game_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:project/shared/utils/showCustomSnackBar.dart';

part 'do_you_mean_controller.g.dart';

@Injectable()
class DoYouMeanController = _DoYouMeanControllerBase with _$DoYouMeanController;

abstract class _DoYouMeanControllerBase with Store {
  @observable
  TextEditingController searchBarController = TextEditingController();

  @observable
  ObservableList<Game> games = ObservableList.of([]);

  @observable
  bool isSearching = false;

  @observable
  ScrollController scrollController = ScrollController();

  @action
  Future<void> findGames(String gameName, {BuildContext context}) async {
    gameName = "star wars";
    isSearching = true;
    games.clear();
    List response;

    try {
      response = await Dio()
          .post("https://api.igdb.com/v4/games/",
              data:
                  'search "$gameName"; limit 30;fields name,cover.image_id,summary,first_release_date,total_rating;', //sort name;',
              options: Options(headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/x-www-form-urlencoded',
                'Client-ID': env["CLIENT_ID"],
                'Authorization': env["AUTHORIZATION"],
              }))
          .then((value) => value.data) as List;
      // print(response);
    } catch (DioErro) {
      showCustomSnackBar(context, text: "Connection or server Error");
    }
    response.forEach((element) {
      Game game = Game.fromJson(element);
      games.add(game);
    });

    if (games.length == 1) {
      Modular.to
          .push(MaterialPageRoute(builder: (_) => DetailsModule(games[0])));
    }

    isSearching = false;
    return;
  }

  @action
  Future<void> openGame(Game game) async {
    await Modular.to
        .push(MaterialPageRoute(builder: (_) => DetailsModule(game)));
  }

  @action
  void backToTop() {
    print(scrollController.offset);
    scrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }
}
