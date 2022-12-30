import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'Task.dart';

class Lista extends StatefulWidget {
  const Lista({super.key});

  @override
  State<Lista> createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  List<Task> dados = <Task>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Lista")),
        body: ListView.separated(
            itemBuilder: (context, item) {
              Task task = dados[item];
              return ListTile(
                title: Text(task.nome),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: dados.length));
  }
}
