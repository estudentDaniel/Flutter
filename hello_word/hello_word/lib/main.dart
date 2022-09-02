import 'package:flutter/material.dart';
import 'package:hello_word/tela.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Hello Word",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TelaHelloWorld(),
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
