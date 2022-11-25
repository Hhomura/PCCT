import 'package:flutter/material.dart';

const List<String> courseOpt = <String>[
  "Recursos Pesqueiros",
  "Jogos Digitais"
      "Administração"
];
const List<String> yearOpt = <String>["1", "2", "3"];
String courseIcon = "ifamlogo.png";

class RegisteredPage extends StatefulWidget {
  const RegisteredPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RegisteredPageState();
}

class RegisteredPageState extends State<RegisteredPage> {
  final courseChoice = ValueNotifier("");
  final yearChoice = ValueNotifier("");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(children: [
              const SizedBox(
                width: 40,
              ),
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/$courseIcon"),
                      fit: BoxFit.fill),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ValueListenableBuilder(
                    valueListenable: courseChoice,
                    builder: (context, val, _) => SizedBox(
                      width: 130,
                      height: 55,
                      child: DropdownButton<String>(
                          isExpanded: true,
                          hint: const Text("Selecionar Turma"),
                          value:
                              (val.toString().isEmpty) ? null : val.toString(),
                          onChanged: (str) => setState(() {
                                courseChoice.value = str.toString();
                                switch (str.toString()) {
                                  case ("Recursos Pesqueiros"):
                                    courseIcon = "ponyo.jpg";
                                    break;
                                  case ("Jogos Digitais"):
                                    courseIcon = "jogos.jpg";
                                    break;
                                  case ("Administração"):
                                    courseIcon = "adm.jpg";
                                    break;
                                }
                              }),
                          items: courseOpt
                              .map<DropdownMenuItem<String>>(
                                  (act) => DropdownMenuItem<String>(
                                        value: act,
                                        child: Text(act),
                                      ))
                              .toList()),
                    ),
                  ),
                  ValueListenableBuilder(
                      valueListenable: yearChoice,
                      builder: (context, val, _) => SizedBox(
                            width: 130,
                            height: 55,
                            child: DropdownButton<String>(
                              isExpanded: true,
                              hint: const Text("Selecionar Ano"),
                              value: val.toString().isEmpty
                                  ? null
                                  : val.toString(),
                              onChanged: (str) =>
                                  yearChoice.value = str.toString(),
                              items: yearOpt
                                  .map<DropdownMenuItem<String>>(
                                      (act) => DropdownMenuItem(
                                            value: act,
                                            child: Text(act),
                                          ))
                                  .toList(),
                            ),
                          )),
                ],
              ),
            ]),
            SizedBox(
              height: 400,
            )
          ],
        ),
      ),
    );
  }
}
