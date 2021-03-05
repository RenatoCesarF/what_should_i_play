import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'search_controller.g.dart';

class SearchController = _SearchControllerBase with _$SearchController;

abstract class _SearchControllerBase with Store {}
