import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'do_you_mean_controller.g.dart';

@Injectable()
class DoYouMeanController = _DoYouMeanControllerBase with _$DoYouMeanController;

abstract class _DoYouMeanControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
