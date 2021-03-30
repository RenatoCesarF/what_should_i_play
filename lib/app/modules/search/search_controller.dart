import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobx/mobx.dart';

part 'search_controller.g.dart';

class SearchController = _SearchControllerBase with _$SearchController;

abstract class _SearchControllerBase with Store {
  @observable
  TextEditingController searchBarController = TextEditingController();

  @observable
  AnimationController animController;
  @observable
  Animation<num> animation;

  Future searchGame() async {
    String gameName = searchBarController.text;
    await Dio().post("${env["BASE_URL"]}/games",
        data: "fields name,cover.image_id; search $gameName; limit 30;",
        options: Options(headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/x-www-form-urlencoded',
          'Client-ID': env["CLIENT_ID"],
          'Authorization': env["AUTHORIZATION"],
        }));
  }
}
