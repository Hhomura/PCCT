import 'package:flutter/material.dart';
import 'package:ios_android/controller/register_control.dart';

String courseIcon = "ifamlogo.png";

class RegisteredPage extends StatefulWidget {
  const RegisteredPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RegisteredPageState();
}

class RegisteredPageState extends State<RegisteredPage> {
  final courseChoice = ValueNotifier("");
  turmaCheck() async {
    while (RegisterControl.instance.turmas.isEmpty) {
      await Future.delayed(const Duration(seconds: 1));
      print("Notifying...");
      setState(() {
        RegisterControl.instance.updateTurmas();
      });
    }
  }

  List<String> cursos = RegisterControl.instance.cursos;

  @override
  Widget build(BuildContext context) {
    turmaCheck();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 65),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                                if (str.toString().contains("JOGOS")) {
                                  courseIcon = "jogos.jpg";
                                } else if (str.toString().contains("RP")) {
                                  courseIcon = "ponyo.jpg";
                                } else if (str.toString().contains("ADM")) {
                                  courseIcon = "ponyo.jpg";
                                } else if (str.toString().contains("INFO")) {
                                  courseIcon = "jogos.jpg";
                                } else {
                                  courseIcon = "ifamlogo.png";
                                }
                              }),
                          items: RegisterControl.instance.turmas
                              .map<DropdownMenuItem<String>>(
                                  (act) => DropdownMenuItem<String>(
                                        value: '${act.curso} ${act.ano}',
                                        child: Text('${act.curso} ${act.ano}'),
                                      ))
                              .toList()),
                    ),
                  ),
                ],
              ),
            ]),
            const SizedBox(
              height: 400,
            )
          ],
        ),
      ),
    );
  }
}

Widget alunos() {
  throw UnimplementedError();
}
