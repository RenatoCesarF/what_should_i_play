import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'recomendations_controller.g.dart';

class RecomendationsController = _RecomendationsControllerBase with _$RecomendationsController;

abstract class _RecomendationsControllerBase with Store {}
