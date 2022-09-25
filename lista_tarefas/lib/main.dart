import 'package:flutter/material.dart';
import 'package:lista_tarefas/cadastro.dart';
import 'package:lista_tarefas/home_screnn.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: Cadastro(),
  ));
}
