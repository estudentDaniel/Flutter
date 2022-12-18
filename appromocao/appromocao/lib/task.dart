class task {
  String id;
  String? titulo;
  String? descricao;
  double? preco;

  task(
      {required this.id,
      required this.titulo,
      required this.descricao,
      required this.preco}); //constructor

  factory task.fromJson(Map<String, dynamic> map) => task(
        id: map['id'],
        titulo: map['titulo'],
        descricao: map['descricao'],
        preco: map['preco'],
      );
  Map<String, dynamic> toMap() =>
      {"id": id, "titulo": titulo, "descricao": descricao, "preco": preco};

  // @override
  // String toString() {
  //   return "task(id: $id, titulo: $titulo, descricao: $descricao, preco: $preco";
  // }
}
