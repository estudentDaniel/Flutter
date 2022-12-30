import 'package:flutter/material.dart';
import 'dart:ui';

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
  double res = 0.0;
  String result = '';
  void _incrementCounter() {
    setState(() {
      nome = (nameController.text);
      altura = (double.parse(AlturaController.text));
      peso = (double.parse(pesoController.text));
      res = peso / (altura * altura);
      res.toString();
      res.toStringAsFixed(2);
      imc = res;
      if (imc <= 18.5) {
        result = "Magro";
      } else if (imc >= 18.5) {
        result = "normal";
      } else if (imc >= 25 && imc <= 29.9) {
        result = "sobre peso";
      } else if (imc >= 30 && imc <= 34.9) {
        result = "Obesidade 1";
      } else if (imc >= 35 && imc <= 39.9) {
        result = "Obesidade 2";
      } else if (imc >= 50) {
        result = "Obesidade 3";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Imc KG"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            Container(
              height: 150,
              child: Image.asset("img/kilo.png"),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  const Padding(padding: EdgeInsets.all(8)),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "Digite seu Nome"),
                  ),
                  TextField(
                    controller: AlturaController,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "Digite sua Altura"),
                  ),
                  TextField(
                    controller: pesoController,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "Digite seu peso"),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(8)),
            SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(
                  onPressed: _incrementCounter, child: Text("Calcular")),
            ),
            Padding(padding: EdgeInsets.all(8)),
            Center(
              child: Container(
                height: 52,
                width: 170,
                child: Text(
                  "$nome Seu imc é: ${imc.toStringAsFixed(2)}. Grauº peso: $result",
                  style: const TextStyle(fontSize: 13, color: Colors.black),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(8)),
            Container(
              height: 50,
              color: Colors.blue[500],
              child: const Center(child: Text("Valor menor 18,5. Peso baixo")),
            ),
            Container(
              height: 50,
              color: Colors.blue[400],
              child: const Center(
                  child: Text("Valor entre 18,6 e 24,9. Peso normal")),
            ),
            Container(
              height: 50,
              color: Colors.blue[300],
              child: const Center(
                  child:
                      Text("Valor entre 25,0 e 29,9. levemente acima do peso")),
            ),
            Container(
              height: 50,
              color: Colors.blue[200],
              child: const Center(
                  child: Text("Valor entre 30 e 34,9. Obesidade grauº 1")),
            ),
            Container(
              height: 50,
              color: Colors.blue[100],
              child: const Center(
                  child: Text("Valor entre 35 e 39,9. Obesidade grauº 2")),
            ),
            Container(
              height: 50,
              color: Colors.blue[70],
              child: const Center(
                  child: Text("Valor maior que 40. Obesidade grauº 3")),
            ),
          ],
        ),
      ),
    );
  }
}
