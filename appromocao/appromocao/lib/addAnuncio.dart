import 'dart:convert';

import 'UrlAPi.dart' as apiUrl;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:appromocao/anuncios.dart';
import 'package:appromocao/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'task.dart';

class AddAnuncio extends StatefulWidget {
  task? tarefa;
  AddAnuncio({this.tarefa});

  @override
  State<AddAnuncio> createState() => _AddAnuncioState();
}

class _AddAnuncioState extends State<AddAnuncio> {
  // late Future<List<task>> list;
  List<task> list = List<task>.empty(growable: true);
  final TextEditingController titulo = new TextEditingController();
  final TextEditingController descricao = new TextEditingController();
  TextEditingController preco = new TextEditingController();

  Future<bool> postar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var urlApi = apiUrl.URl;
    var api = Uri.parse('${urlApi}/usuario/');
    var response = await http.post(
      api,
      body: {
        'titulo': titulo.text,
        'descricao': descricao.text,
        'preco': preco.text,
      },
    );
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      prefs.setString('token', res['token']);
      return true;
    } else {
      print(jsonDecode(response.body));
      return false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 254, 254, 255),
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(children: [
          TextFormField(
            controller: titulo,
            decoration: const InputDecoration(
              label: Text(
                "Titulo",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                ),
              ),
              labelStyle: TextStyle(fontSize: 20),
            ),
          ),
          TextFormField(
            controller: descricao,
            decoration: const InputDecoration(
              label: Text(
                "Descricao",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                ),
              ),
              labelStyle: TextStyle(fontSize: 20),
            ),
          ),
          TextFormField(
            controller: preco,
            decoration: const InputDecoration(
              label: Text(
                "Preco",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                ),
              ),
              labelStyle: TextStyle(fontSize: 20),
            ),
          ),
          Padding(padding: EdgeInsets.all(8)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(8)),
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    double p = (double.parse(preco.text));
                    task tasks = task(
                        id: '',
                        titulo: titulo.text,
                        descricao: descricao.text,
                        preco: p);
                    list.add(tasks);
                    Navigator.pop(context, task);

                    //MaterialPageRoute(builder: ((context) => Anuncio()));
                  },
                  child: Text("Adicionar"),
                ),
              ),
              Padding(padding: EdgeInsets.all(8)),
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => Anuncio())))
                  },
                  child: Text("Cancelar"),
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
