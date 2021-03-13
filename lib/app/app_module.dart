import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/app/app_widget.dart';
import 'package:project/app/modules/details/details_module.dart';
import 'package:project/app/modules/details/details_page.dart';

import 'modules/search/search_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: SearchModule()),
        //ModularRouter("/rota", module: Module()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
