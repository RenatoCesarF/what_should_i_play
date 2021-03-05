import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'What Should I Play',
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      theme: ThemeData(fontFamily: "Poppins"),
    );
  }
}
