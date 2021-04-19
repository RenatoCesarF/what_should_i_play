// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_modular/flutter_modular.dart';
import './recomendations_page.dart';
import './recomendations_controller.dart';

class RecomendationsModule extends WidgetModule {
  final String gameId;

  RecomendationsModule({this.gameId});

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
        gameId: gameId,
      );
}
