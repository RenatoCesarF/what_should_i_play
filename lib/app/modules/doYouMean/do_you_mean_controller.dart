import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/shared/models/game_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

part 'do_you_mean_controller.g.dart';

@Injectable()
class DoYouMeanController = _DoYouMeanControllerBase with _$DoYouMeanController;

abstract class _DoYouMeanControllerBase with Store {
  @observable
  List<Game> games = [];
  // @observable
  // ObservableList<Game> games = ObservableList.of([]);
  //
  @action
  Future<void> findGames(String gameName) async {
    List response = await Dio()
        .post("https://api.igdb.com/v4/games/",
            data:
                'fields name,cover.image_id,first_release_date,genres.name,platforms.name,total_rating, involved_companies.company.name,involved_companies.developer; search "zelda"; limit 10;',
            options: Options(headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/x-www-form-urlencoded',
              'Client-ID': env["CLIENT_ID"],
              'Authorization': env["AUTHORIZATION"],
            }))
        .then((value) => value.data) as List;

    response.forEach((element) {
      Game game = Game.fromJson(element);
      games.add(game);
    });
  }
}
