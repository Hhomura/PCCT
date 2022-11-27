import 'package:flutter/material.dart';
import 'package:ios_android/controller/register_control.dart';

import '../../controller/app_controller.dart';
import '../../model/aluno.dart';

String courseIcon = "ifamlogo.png";
const assets = <String, String>{
  "ADM": "assets/adm.jpg",
  "IFAM": "assets/ifamlogo.png",
  "JOGOS": "assets/jogos.jpg",
  "RP": "assets/ponyo.jpg"
};

class RegisteredPage extends StatefulWidget {
  const RegisteredPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RegisteredPageState();
}

class RegisteredPageState extends State<RegisteredPage> {
  final courseChoice = ValueNotifier("");

  /*
   *os dois métodos seguintes servem para atualizar o estado da aplicação após a
   *confirmação de recebimento dos dados. Essa confimação é um loop em que só é po
   *ssível retornar, se tiver algum dado na lista.
  */
  turmaCheck() async {
    RegisterControl.instance.updateTurmas();
    while (RegisterControl.instance.turmas.isEmpty) {
      await Future.delayed(const Duration(seconds: 1));
      print("Notifying...");
    }
    setState(() {});
  }

  List<String> cursos = RegisterControl.instance.cursos;

  bool isToday = false;
  alunoCheck({required String turma, String? dia}) async {
    String ano = "";
    String curso = "";

    ano = turma.replaceAll(nameRegExp, '');
    ano = ano.replaceAll(' ', '');

    curso = turma.replaceAll(numberRegExp, '');
    curso = curso.replaceAll(' ', '');
    print(curso + ano);

    RegisterControl.instance.alunos.clear();
    RegisterControl.instance.updateAlunos(curso: curso, ano: ano);
    while (RegisterControl.instance.alunos.isEmpty) {
      await Future.delayed(const Duration(milliseconds: 500));
      print("Notifying Alunos");
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    turmaCheck();
    return Scaffold(
      appBar: registerAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
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

                                alunoCheck(turma: str.toString());
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
                  Row(children: [
                    Text("Somente Hoje"),
                    Switch(
                        value: RegisterControl.instance.isToday,
                        onChanged: (val) => setState(() {
                              RegisterControl.instance.updateBool();
                              alunoCheck(turma: courseChoice.value);
                            })),
                  ])
                ],
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 400,
              child: ListView.separated(
                  itemBuilder: ((context, index) => ListTile(
                        leading: Image.asset(assets["IFAM"]!),
                        title:
                            Text(RegisterControl.instance.alunos[index].nome),
                        trailing: Text(RegisterControl
                            .instance.alunos[index].matricula
                            .toString()),
                      )),
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: RegisterControl.instance.alunos.length),
            ),
            const Padding(padding: EdgeInsets.all(5)),
          ],
        ),
      ),
    );
  }

  AppBar registerAppBar() {
    return AppBar(
      title: const Center(
        child: Text("IFAM - Registros"),
      ),
      backgroundColor: (!AppController.instance.isDarkBrightness)
          ? const Color.fromARGB(255, 54, 127, 255)
          : Colors.deepPurpleAccent,
    );
  }

  static final RegExp numberRegExp = RegExp(r'\d');
  static final RegExp nameRegExp = RegExp('[a-zA-Z]');
}
