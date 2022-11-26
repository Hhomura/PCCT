abstract class HttpServ<T> {
  Future<List<T>> alunoGet(String route);
  Future<List<T>> turmaGet({String route});
}
