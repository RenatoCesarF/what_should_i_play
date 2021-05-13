import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/app/modules/doYouMean/do_you_mean_controller.dart';
import 'package:project/app/modules/search/search_module.dart';

class SearchBar extends StatelessWidget {
  final DoYouMeanController controller;

  SearchBar(this.controller);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      color: Theme.of(context).dividerColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 40,
            child: TextButton(
              onPressed: () async => await Modular.to
                  .push(MaterialPageRoute(builder: (_) => SearchModule())),
              child: Icon(Icons.arrow_back_rounded,
                  size: 30, color: Theme.of(context).accentColor), //changed
            ),
          ),
          Expanded(
            child: TextField(
              onEditingComplete: () {
                controller.findGames(controller.searchBarController.text);
                FocusScope.of(context).unfocus();
              },
              controller: controller.searchBarController,
              onChanged: (value) {
                controller.searchBarController.text = value;
              },
              decoration: InputDecoration(
                  isDense: true,
                  hintText: "A game that you have enjoyed",
                  hintStyle: TextStyle(color: Color(0x66979797))),
              autocorrect: false,
              style: TextStyle(
                color: Colors.white,
              ),
              selectionHeightStyle: BoxHeightStyle.tight,
              textAlign: TextAlign.center,
              cursorColor: Theme.of(context).accentColor, //changed
            ),
          ),
          SizedBox(
            width: 40,
            child: TextButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                controller.findGames(controller.searchBarController.text);
              },
              child: Icon(
                Icons.search_rounded,
                size: 30,
                color: Theme.of(context).accentColor, //changed
              ),
            ),
          ),
        ],
      ),
    );
  }
}
