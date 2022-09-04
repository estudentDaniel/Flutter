import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    home: ImcPage(),
  ));
}

class ImcPage extends StatelessWidget {
  const ImcPage({Key? key}) : super(key: key);
  TextEditingController nameController = new TextEditingController();
  TextEditingController AlturaController = new TextEditingController();
  TextEditingController pesoController = new TextEditingController();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Imc KG"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          Container(
            height: 150,
            child: Image.asset("img/kilo.png"),
          ),
          Container(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: "Digite seu Nome"),
                ),
                const TextField(
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: "Digite sua Altura"),
                ),
                const TextField(
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: "Digite seu peso"),
                ),
                Padding(padding: EdgeInsets.all(8)),
                ElevatedButton(onPressed: () {}, child: Text("Calculate")),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(8)),
          Container(
            height: 50,
            color: Colors.blue[500],
            child: const Center(child: Text("1º Imc KG")),
          ),
          Container(
            height: 50,
            color: Colors.blue[400],
            child: const Center(child: Text("2º Imc KG")),
          ),
          Container(
            height: 50,
            color: Colors.blue[300],
            child: const Center(child: Text("3º Imc KG")),
          ),
        ],
      ),
    );
  }
}
