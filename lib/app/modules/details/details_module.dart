// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/shared/models/game_model.dart';
import 'details_page.dart';
import 'details_controller.dart';

class DetailsModule extends WidgetModule {
  final Game game;

  DetailsModule(this.game);

  @override
  List<Bind> get binds => [
        Bind((i) => DetailsController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/details', child: (_, args) => DetailsPage(game)),
      ];

  static Inject get to => Inject<DetailsModule>.of();

  @override
  Widget get view => DetailsPage(game);
}
