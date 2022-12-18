import 'dart:convert';

task addfromJson(String str) => task.fromJson(json.decode(str));
String toJson(task data) => json.encode(data.toMap());

class task {
  String id;
  String titulo;
  String descricao;
  double preco;

  task(
      {required this.id,
      required this.titulo,
      required this.descricao,
      required this.preco}); //constructor

  factory task.fromJson(Map<String, dynamic> json) => task(
        id: json['id'],
        titulo: json['titulo'],
        descricao: json['descricao'],
        preco: json['preco'],
      );
  Map<String, dynamic> toMap() =>
      {"id": id, "titulo": titulo, "descricao": descricao, "preco": preco};
}
