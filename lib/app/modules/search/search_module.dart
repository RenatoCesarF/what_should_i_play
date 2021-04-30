// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'search_page.dart';
import './search_controller.dart';

class SearchModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SearchController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/search", child: (_, args) => SearchPage()),
      ];

  static Inject get to => Inject<SearchModule>.of();

  @override
  Widget get view => SearchPage();
}
