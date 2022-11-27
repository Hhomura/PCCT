import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ios_android/model/aluno.dart';
import 'package:ios_android/services/httpservices.dart';

import '../model/turma.dart';

class Http implements HttpServ {
  final url = 'http://localhost:8000/';
  final routeal = 'alunos/';
  final routetu = 'turmas/';
  final routecursos = 'turmas/cursos/';
  final headers = {'Content-Type': 'apllication/json'};
  final encodig = Encoding.getByName('utf-8');

  Http();

  String parseRoute(
      {required String? curso, required String? ano, String? dia}) {
    String route = '$url$routeal$curso/$ano/';

    if (dia != null) route += dia;

    print(route);
    return route;
  }

  //REQUISIÇÃO GET, SE TIVER PARAMETROS, ESPECIFICA DEPENDENDO DOS MESMOS
  @override
  Future<List<Aluno>> alunoGet(String route) async {
    http.Response res = await http.get(Uri.parse(route));
    List<Aluno> result = List<Aluno>.from(
        json.decode(res.body).map((json) => Aluno.fromJson(json)));
    result.sort((a, b) => a.id.compareTo(b.id));

    return result;
  }

  @override
  Future<List<Turma>> turmaGet() async {
    http.Response res = await http.get(Uri.parse('$url$routetu'));

    List<Turma> result = List<Turma>.from(
        json.decode(res.body).map((json) => Turma.fromJson(json)));
    result.sort((a, b) => a.id.compareTo(b.id));

    return result;
  }
}
