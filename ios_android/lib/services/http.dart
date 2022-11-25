import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ios_android/model/aluno.dart';
import 'package:ios_android/services/httpservices.dart';

class Http implements HttpServ {
  final url = 'http://localhost:8000/';
  final alunos = 'alunos/';
  final curso = 'alunos/cusrso';
  final headers = {'Content-Type': 'apllication/json'};
  final encodig = Encoding.getByName('utf-8');

  Http();

  @override
  Future<List<Aluno>> alunoGet() async {
    http.Response res = await http.get(Uri.parse('$url$alunos'));
    List<Aluno> result = List<Aluno>.from(
        json.decode(res.body).map((json) => Aluno.fromJson(json)));
    result.sort((a, b) => a.id.compareTo(b.id));
    print(res.statusCode);
    for (var element in result) {
      print(element.nome);
    }
    return result;
  }
}
