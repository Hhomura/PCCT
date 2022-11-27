//Read Only
class Turma {
  int id = -1;
  String curso = '';
  String ano = '';

  Turma();
  Turma.db(this.id, this.curso, this.ano);
  Map toJson() => {
        "id_Turma": id,
        "curso": curso,
        "ano": ano,
      };

  factory Turma.fromJson(Map<String, dynamic> json) {
    return Turma.db(
      json['id_Turma'] as int,
      json['curso'] as String,
      json['ano'] as String,
    );
  }
}
