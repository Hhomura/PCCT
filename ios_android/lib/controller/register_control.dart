import 'package:flutter/material.dart';
import 'package:ios_android/model/turma.dart';
import 'package:ios_android/services/http.dart';

import '../model/aluno.dart';

class RegisterControl extends ChangeNotifier {
  static RegisterControl instance = RegisterControl();
  List<Turma> _turmas = [];
  List<Aluno> _alunos = [];
  List<String> _cursos = [];

  Http http = Http();
  updateTurmas() async {
    _turmas = await http.turmaGet();
    _turmas.sort(
      (a, b) => a.curso.compareTo(b.curso),
    );
    notifyListeners();
  }

  updateAlunos() async {
    _alunos = await http.alunoGet(http.parseRoute(curso: "JOGOS", ano: "3"));
    _alunos.sort(
      (a, b) => a.nome.compareTo(b.nome),
    );
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
