// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_modular/flutter_modular.dart';
import './do_you_mean_page.dart';
import './do_you_mean_controller.dart';

class DoYouMeanModule extends WidgetModule {
  final String gameName;

  DoYouMeanModule({this.gameName});

  @override
  List<Bind> get binds => [
        Bind((i) => DoYouMeanController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/doYouMean',
            child: (_, args) => DoYouMeanPage(gameName: gameName)),
      ];

  static Inject get to => Inject<DoYouMeanModule>.of();

  @override
  Widget get view => DoYouMeanPage(gameName: gameName);
}
