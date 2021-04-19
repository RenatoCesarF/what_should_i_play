import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:project/app/modules/search/search_controller.dart';

class RecomendationsPage extends StatefulWidget {
  final String title;
  final String gameId;
  const RecomendationsPage({Key key, this.title = "DoYouMean", this.gameId}) : super(key: key);

  @override
  _RecomendationsPageState createState() => _RecomendationsPageState();
}

class _RecomendationsPageState extends State<RecomendationsPage>
    with SingleTickerProviderStateMixin {
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
        return Container();
      }),
    );
  }
}
