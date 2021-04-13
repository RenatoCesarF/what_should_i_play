import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:project/app/modules/search/search_controller.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with SingleTickerProviderStateMixin {
  final SearchController controller = SearchController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff322A5C),
      body: Observer(builder: (_) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 28, vertical: 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
            Spacer(flex: 2),
            Container(
              child: Image.asset(
                'assets/images/logo.png',
              ),
            ),
            Text(
              "Write down a game that you enjoyed,\n and discover your next expirence",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff979797),
                  fontFamily: "Roboto",
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic),
            ),
            Spacer(flex: 3),
            TextField(
                controller: controller.searchBarController,
                onChanged: (value) {
                  controller.searchBarController.text = value;
                },
                decoration: InputDecoration(
                    //it was a gesture detector before
                    suffixIcon: TextButton(
                      onPressed: () {
                        controller.pushToDoYouMeanPage(this.context);
                      },
                      child: Icon(
                        Icons.search_rounded,
                        size: 30,
                        color: Color(0xffF21B3F),
                      ),
                    ),
                    prefixIcon: GestureDetector(
                        onTap: () {
                          controller.searchBarController.text = '';
                          controller.searchBarController.clear();
                        },
                        child: Icon(Icons.cancel, color: Color(0xffF21B3F))),
                    isDense: false,
                    hintText: "A game that you have enjoyed",
                    hintStyle: TextStyle(color: Color(0x66979797))),
                autocorrect: false,
                style: TextStyle(
                  color: Colors.white,
                ),
                selectionHeightStyle: BoxHeightStyle.tight,
                textAlign: TextAlign.center,
                cursorColor: Color(0xffF21B3F)),
            Spacer(
              flex: 3,
            )
          ]),
        );
      }),
    );
  }
}
