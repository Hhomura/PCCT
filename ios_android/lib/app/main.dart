import 'package:flutter/material.dart';
import 'package:ios_android/view/home/HomePageController.dart';
import 'package:ios_android/view/register/RegisteredPage.dart';

import '../view/home/HomePage.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: HomePageController.instance,
      builder: (context, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.red,
              fontFamily: "sans-serif",
              brightness: HomePageController.instance.isDarkBrightness
                  ? Brightness.dark
                  : Brightness.light,
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => const HomePage(),
              '/Registered': (context) => const RegisteredPage(),
            });
      },
    );
  }
}
