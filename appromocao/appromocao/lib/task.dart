class task {
  late String id;
  late String titulo;
  late String descricao;
  late double preco;

  task(
      {required this.id,
      required this.titulo,
      required this.descricao,
      required this.preco}); //constructor

  task.fromMap(Map map) {
    //busca banco
    id = map[id];
    titulo = map[titulo];
    descricao = map[descricao];
    preco = map[preco];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'preco': preco
    };
    return map;
  }

  @override
  String toString() {
    return "Task(id: $id, titulo: $titulo, descricao: $descricao, preco: $preco";
  }

  void then(Set<void> Function(dynamic data) param0) {}
}
