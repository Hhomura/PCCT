//Read Only
class Aluno {
  int id = 0;
  int rfid = 0;
  int matricula = 0;
  String nome = '';
  int numcel = 0;

  Map toJson() => {
        "id_Aluno": id,
        "nome": nome,
        "rfid": rfid,
        "matricula": matricula,
        "numcel": numcel
      };

  Aluno.db(this.id, this.matricula, this.nome, this.numcel, this.rfid);
  Aluno();
  factory Aluno.fromJson(Map<String, dynamic> json) {
    return Aluno.db(
      json['id_Aluno'] as int,
      json['matricula'] as int,
      json['nome'] as String,
      json['numcel'] as int,
      json['rfid'] as int,
    );
  }
}
