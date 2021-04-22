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
      backgroundColor: Theme.of(context).primaryColor,
      body: Observer(builder: (_) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 40,
                  child: TextButton(
                      onPressed: () {
                        //FocusScope.of(context).unfocus();
                        controller.searchBarController.text = '';
                        controller.searchBarController.clear();
                      },
                      child: Icon(Icons.cancel, color: Theme.of(context).accentColor)),
                ),
                Expanded(
                  child: TextField(
                    onEditingComplete: () => controller.pushToDoYouMeanPage(this.context),
                    controller: controller.searchBarController,
                    onChanged: (value) {
                      controller.searchBarController.text = value;
                    },
                    decoration: InputDecoration(

                        //it was a gesture detector before

                        isDense: true,
                        hintText: "A game that you have enjoyed",
                        hintStyle: TextStyle(color: Color(0x66979797))),
                    autocorrect: false,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    selectionHeightStyle: BoxHeightStyle.tight,
                    textAlign: TextAlign.center,
                    cursorColor: Theme.of(context).accentColor,
                  ),
                ),
                SizedBox(
                  width: 40,
                  child: TextButton(
                    onPressed: () => controller.pushToDoYouMeanPage(this.context),
                    child: Icon(
                      Icons.search_rounded,
                      size: 30,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(flex: 3)
          ]),
        );
      }),
    );
  }
}
