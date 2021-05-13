import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:project/app/modules/search/search_controller.dart';
import 'package:project/shared/utils/showCustomSnackBar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  final SearchController controller = SearchController();

  @override
  void initState() {
    super.initState();
    controller.pageFocus = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Builder(
            builder: (context) => // Ensure Scaffold is in context
                IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Theme.of(context).accentColor,
                      size: 30,
                    ),
                    onPressed: () {
                      // controller.pageFocus.unfocus();
                      Scaffold.of(context).openDrawer();
                    }),
          ),
        ),
        drawer: Drawer(
          child: Container(
            color: Theme.of(context).dividerColor,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                    height: 150,
                    width: double.infinity,
                    color: Theme.of(context).primaryColor,
                    child: Center(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 40,
                          child: TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Theme.of(context).accentColor,
                              )),
                        ),
                        Text(
                          'Menu',
                          style: TextStyle(
                              fontSize: 30,
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.w900),
                        ),
                        Container(width: 60)
                      ],
                    ))),
                ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Theme.of(context).accentColor,
                  ),
                  title: Text('Profile',
                      style: TextStyle(
                          fontSize: 19,
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.w900)),
                  onTap: () {
                    showCustomSnackBar(context,
                        text: "This is not possible yet");
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Theme.of(context).accentColor,
                  ),
                  title: Text('Settings',
                      style: TextStyle(
                          fontSize: 19,
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.w900)),
                  onTap: () {
                    showCustomSnackBar(context,
                        text: "This is not possible yet");
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.info,
                    color: Theme.of(context).accentColor,
                  ),
                  title: Text('Info',
                      style: TextStyle(
                          fontSize: 19,
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.w900)),
                  onTap: () {
                    showAboutDialog(
                        context: context,
                        applicationIcon: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            "assets/images/icon.png",
                            scale: 3.5,
                          ),
                        ),
                        children: [
                          Row(
                            children: [
                              Text("Made with"),
                              Icon(Icons.favorite),
                              Text("By Renato Cesar")
                            ],
                          ),
                          GestureDetector(
                            onTap: () async => {
                              await canLaunch(
                                      "https://github.com/RenatoCesarF/what_should_i_play")
                                  ? await launch(
                                      "https://github.com/RenatoCesarF/what_should_i_play")
                                  : throw 'Could not launch '
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  "assets/images/websiteSymbols/github.png",
                                  scale: 18,
                                ),
                                Text("Repository"),
                                Container(
                                  width: 120,
                                )
                              ],
                            ),
                          )
                        ]);
                  },
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  !isKeyboardVisible
                      ? Padding(
                          padding: const EdgeInsets.only(top: 80),
                          child: Column(
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/images/logo.png',
                                ),
                              ),
                              Text(
                                "Write down a game that you enjoyed,\n and discover your next expirence",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Theme.of(context).canvasColor,
                                    fontFamily: "Roboto",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.00),
                    child: Row(
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
                              child: Icon(Icons.cancel,
                                  color: Theme.of(context).accentColor)),
                        ),
                        Expanded(
                          child: TextField(
                            focusNode: controller.pageFocus,
                            onEditingComplete: () =>
                                controller.pushToDoYouMeanPage(this.context),
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
                            cursorColor: Theme.of(context).accentColor,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: TextButton(
                            onPressed: () =>
                                controller.pushToDoYouMeanPage(this.context),
                            child: Icon(
                              Icons.search_rounded,
                              size: 30,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(flex: 3)
                ]),
          );
        }));
  }

  @override
  void dispose() {
    controller.pageFocus.dispose();
    super.dispose();
  }
}
