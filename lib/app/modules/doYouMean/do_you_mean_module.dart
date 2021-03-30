import 'do_you_mean_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'do_you_mean_page.dart';

class DoYouMeanModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => DoYouMeanController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => DoYouMeanPage()),
      ];

  static Inject get to => Inject<DoYouMeanModule>.of();
}
