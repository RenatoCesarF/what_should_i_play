import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

part 'search_controller.g.dart';

class SearchController = _SearchControllerBase with _$SearchController;

abstract class _SearchControllerBase with Store {
  @observable
  TextEditingController searchBarController = TextEditingController();

  @observable
  AnimationController animController;
  @observable
  Animation<num> animation;

  @action
  Future searchGame() async {}
}
