import 'package:flutter/material.dart';
import 'package:ios_android/qrcode_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.blueAccent,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.amberAccent,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 36),
            onPrimary: Colors.black,
            textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      home: const QRCodePage(),
    );
  }
}