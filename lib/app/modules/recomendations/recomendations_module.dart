// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/shared/models/game_model.dart';
import './recomendations_page.dart';
import './recomendations_controller.dart';

class RecomendationsModule extends WidgetModule {
  final Game game;

  RecomendationsModule({this.game});

  @override
  List<Bind> get binds => [
        Bind((i) => RecomendationsController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => RecomendationsPage()),
      ];

  static Inject get to => Inject<RecomendationsModule>.of();

  @override
  Widget get view => RecomendationsPage(
        game: game,
      );
}
