import 'package:flutter/material.dart';
import 'package:what_to_do/pages/allTask.dart';
import 'package:what_to_do/pages/events.dart';
import 'package:what_to_do/pages/health.dart';
import 'package:what_to_do/pages/home.dart';
import 'package:what_to_do/pages/homePage.dart';
import 'package:what_to_do/pages/shopping.dart';
import 'package:what_to_do/pages/trash.dart';
import 'package:what_to_do/pages/work.dart';
import 'package:what_to_do/utility/themes.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(ChangeNotifierProvider(
      child: MyApp(),
      create: (BuildContext context) => AppTheme(isDarkTheme: true),
  ));
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(
      builder: (context, appTheme, child){
        return MaterialApp(
        initialRoute: '/homePage',
        debugShowCheckedModeBanner: false,
        theme: appTheme.getTheme,
        routes: {
        '/homePage':(context)=> HomePage(),
        '/allTask':(context)=> AllTask(),
        '/work':(context)=> WorkFolder(),
        '/home':(context)=> HomeFolder(),
        '/events':(context)=> EventsFolder(),
        '/shopping':(context)=> ShoppingFolder(),
        '/health':(context)=> HealthFolder(),
        '/trash':(context)=> Trash()
        },
        );
      },
    );
  }
}
