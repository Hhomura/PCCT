import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ios_android/model/turma.dart';
import 'package:ios_android/services/http.dart';

import '../model/aluno.dart';

class RegisterControl extends ChangeNotifier {
  static RegisterControl instance = RegisterControl();
  List<Turma> _turmas = [];
  final List<String> _cursos = [];
  Turma turma = Turma();

  List<Aluno> _alunos = [];
  bool isToday = false;

  Http http = Http();

  updateBool() {
    isToday = !isToday;
    notifyListeners();
  }

  updateTurmas() async {
    _turmas = await http.turmaGet();
    _turmas.sort(
      (a, b) => a.curso.compareTo(b.curso),
    );
    notifyListeners();
  }

  updateAlunos({
    required String curso,
    required String ano,
  }) async {
    DateTime now = DateTime.now();
    var formater = DateFormat('yyyy-MM-dd');

    String? dia = (isToday) ? formater.format(now) : null;
    print(dia);
    _alunos =
        await http.alunoGet(http.parseRoute(curso: curso, ano: ano, dia: dia));
    _alunos.sort(
      (a, b) => a.nome.compareTo(b.nome),
    );

    if (_alunos.isEmpty) _alunos.add(Aluno());
    notifyListeners();
  }

  List<String> get cursos {
    for (var turma in _turmas) {
      print(turma.curso.replaceAll(RegExp('/[0-9]/g'), ''));
      _cursos.add(turma.curso.replaceAll(RegExp('/[0-9]/g'), ''));
    }
    return _cursos;
  }

  List<Turma> get turmas => _turmas;
  List<Aluno> get alunos => _alunos;
}
