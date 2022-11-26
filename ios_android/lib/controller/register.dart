import 'package:ios_android/model/turma.dart';
import 'package:ios_android/services/http.dart';

import '../model/aluno.dart';

class RegisterControl {
  RegisterControl();

  Future<List<String>?> getCourse() async {
    List<Turma> turmas = await Http().turmaGet(route: Http().routecursos);
    List<String>? cursos;

    for (var turma in turmas) {
      print(turma.curso);
      cursos?.add(turma.curso);
    }

    return cursos;
  }

  Future<List<Aluno>> getAlunos(
      {required String ano, required String curso, String? dia}) async {
    return await Http().alunoGet(Http().parseRoute(curso: curso, ano: ano));
  }
}
