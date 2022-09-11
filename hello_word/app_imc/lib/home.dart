import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: homeImc(),
  ));
}

class homeImc extends StatefulWidget {
  const homeImc({Key? key}) : super(key: key);

  @override
  State<homeImc> createState() => homeImcState();
}

class homeImcState extends State<homeImc> {
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController AlturaController = new TextEditingController();
  final TextEditingController pesoController = new TextEditingController();
  String nome = '';
  double peso = 0.0;
  double altura = 0.0;
  double imc = 0.0;
  void _incrementCounter() {
    setState(() {
      altura = (double.parse(AlturaController.text));
      peso = (double.parse(pesoController.text));
      imc = (altura * altura / (peso));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Imc KG"),
        centerTitle: true,
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
          ),
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
                TextField(
                  controller: AlturaController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: "Digite sua Altura"),
                ),
                TextField(
                  controller: pesoController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: "Digite seu peso"),
                ),
                Text(""),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            width: 150,
            child: ElevatedButton(
                onPressed: _incrementCounter, child: Text("Calcular")),
          ),
          Text("Imc: $imc"),
          Padding(padding: EdgeInsets.all(8)),
          Container(
            height: 50,
            color: Colors.blue[500],
            child: const Center(child: Text("1º Imc KG")),
          ),
          Container(
            height: 50,
            color: Colors.blue[400],
            child: const Center(child: Text("2º Imc KG ")),
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
