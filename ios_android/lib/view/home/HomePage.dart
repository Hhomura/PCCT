import 'package:flutter/material.dart';
import 'package:ios_android/app/main.dart';
import 'package:ios_android/services/http.dart';
import 'package:ios_android/controller/app_controller.dart';

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
        appBar: homeAppBar(),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset(
                "assets/eating.jpg",
                height: 225,
                width: 225,
              ),
              const Text(
                "CAM - Refeições",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 235,
              ),
              //MenuButton
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: TextButton.icon(
                      icon: const Icon(
                        Icons.account_circle,
                        color: Colors.white,
                        size: 40,
                      ),
                      label: const Text(
                        "Turmas Cadastradas",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                      onPressed: () =>
                          Navigator.pushNamed(context, "/Registered"),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
                  padding: const EdgeInsets.only(
                      left: 40, right: 40, top: 10, bottom: 17),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: TextButton.icon(
                      icon: const Icon(
                        Icons.access_time,
                        color: Colors.white,
                        size: 40,
                      ),
                      label: const Text(
                        "Tempo Real",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                      onPressed: () => Http().turmaGet(),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
              //switch
              Align(
                  alignment: Alignment.centerRight,
                  child: Switch(
                      value: AppController.instance.isDarkBrightness,
                      onChanged: (val) => setState(
                            () => AppController.instance.changeBrightness(),
                          )))
            ],
          )),
        ));
  }

  AppBar homeAppBar() {
    return AppBar(
      title: const Center(
        child: Text("IFAM - Refeições "),
      ),
      backgroundColor: (!AppController.instance.isDarkBrightness)
          ? const Color.fromARGB(255, 54, 127, 255)
          : Colors.deepPurpleAccent,
    );
  }
}
