import 'package:lista_tarefas/taksHelper.dart';

class Task {
  int? id;
  String? text;
  bool done = false; // vou usar como condicao
  String? image;

  Task(this.text, this.image); //constructor

  Task.fromMap(Map map) {
    //busca banco
    this.id = map[TaksHelper.idColumn];
    this.text = map[TaksHelper.textColumn];
    //this.done = map["done"] == 1 ? true : false;
    this.image = map[TaksHelper.imageColumn];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': this.id,
      'text': this.text,
      //'done': this.done,
      'image': this.image
    };
    return map;
  }

  @override
  String toString() {
    return "Task(id: $id, text: $text, image: $image";
  }
}
