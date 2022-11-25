import 'package:flutter/material.dart';
import 'package:ios_android/HomePageController.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 110),
        Image.asset(
          "assets/eating.jpg",
          height: 175,
          width: 175,
        ),
        const Text(
          "CAM - Refeições",
          style: TextStyle(
              fontWeight: FontWeight.w300, fontStyle: FontStyle.italic),
        ),
        const SizedBox(
          height: 275,
        ),
        //MenuButton
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: TextButton.icon(
                icon: const Icon(Icons.account_circle, color: Colors.white),
                label: const Text(
                  "Turmas Cadastradas",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                onPressed: () => Navigator.pushNamed(context, "/Registered"),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )),
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.deepPurpleAccent),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.focused)) {
                      return Colors.red;
                    }
                    if (states.contains(MaterialState.hovered)) {
                      return Colors.green;
                    }
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.redAccent;
                    }
                    return null;
                  }),
                ),
              ),
            )),
        Padding(
            padding:
                const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 40),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: TextButton.icon(
                icon: const Icon(Icons.access_time, color: Colors.white),
                label: const Text(
                  "Tempo Real",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                onPressed: () => print("hey"),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )),
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.deepPurpleAccent),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.focused)) {
                      return Colors.red;
                    }
                    if (states.contains(MaterialState.hovered)) {
                      return Colors.green;
                    }
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.redAccent;
                    }
                    return null;
                  }),
                ),
              ),
            )),
        Row(children: [
          const SizedBox(width: 300),
          const Icon(Icons.ac_unit_sharp),
          Switch(
              value: HomePageController.instance.isDarkBrightness,
              onChanged: (val) => setState(
                    () => HomePageController.instance.changeBrightness(),
                  ))
        ])
      ],
    )));
  }
}
