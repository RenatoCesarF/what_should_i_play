import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Poppins",
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: Color(0xffF21B3F),
        backgroundColor: Color(0xff1F1A38),
        primaryColor: Color(0xff322A5C),
        cardColor: Color(0xff5D4DA8),
        canvasColor: Color(0xff979797),
        textTheme: TextTheme(
          //Big text
          headline1: TextStyle(
            fontSize: 25,
            color: Color(0xff979797),
            fontWeight: FontWeight.bold,
          ),
          bodyText1: TextStyle(
            fontSize: 18,
            color: Theme.of(context).canvasColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      color: Color(0xff1F1A38),
      navigatorKey: Modular.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'What Should I Play',
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
      builder: BotToastInit(),
      themeMode: ThemeMode.dark,
      navigatorObservers: [BotToastNavigatorObserver()],
    );
  }
}
