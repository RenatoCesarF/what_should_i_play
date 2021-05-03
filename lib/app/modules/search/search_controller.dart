import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:project/app/modules/doYouMean/do_you_mean_module.dart';
import '../doYouMean/do_you_mean_module.dart';

part 'search_controller.g.dart';

class SearchController = _SearchControllerBase with _$SearchController;

abstract class _SearchControllerBase with Store {
  @observable
  TextEditingController searchBarController = TextEditingController();

  Future pushToDoYouMeanPage(BuildContext context) async {
    if (searchBarController.text == '') {
      return;
    }
    FocusScope.of(context).unfocus();
    await Modular.to.push(
      MaterialPageRoute(
        builder: (_) => DoYouMeanModule(gameName: searchBarController.text),
      ),
    );
  }
}
