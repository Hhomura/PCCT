//Read Only
class Turma {
  final int id;
  final String curso;
  final String ano;

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

  factory Turma.fromJsonC(Map<String, dynamic> json) {
    return Turma.db(-1, json['curso'] as String, "-1");
  }
}
