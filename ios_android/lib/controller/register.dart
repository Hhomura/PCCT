import 'package:ios_android/services/http.dart';
import 'package:ios_android/services/httpservices.dart';

import '../model/aluno.dart';
import '../services/http.dart';

class ResgisterController {
  const ResgisterController();

  Future<List<Aluno>> getAlunos({String? curso}) async {
    List<Aluno> alunos = await Http().alunoGet();
    if (curso == null) return alunos;

    //A FINALIZAR
    throw UnimplementedError();
  }
}
