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
  late Future<List<task>> list;
  final TextEditingController titulo = new TextEditingController();
  final TextEditingController descricao = new TextEditingController();
  final TextEditingController preco = new TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    list = getAll();
  }
  // void initState() {
  //   super.initState();
  //   if (task != null) {
  //     setState(() {
  //       titulo.text = titulo.text;
  //       descricao.text = descricao.text;
  //       preco.text = preco.text;
  //     });
  //   }
  // }

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
                    bool value = await adicionar();
                    if (value) {
                      task tasks = task(
                          id: "",
                          titulo: titulo.text,
                          descricao: descricao.text,
                          preco: 0.0);

                      Navigator.pop(context, tasks);

                      setState(() {
                        bool list = adicionar() as bool;
                      });

                      // MaterialPageRoute(builder: ((context) => Anuncio()));
                    }
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                Anuncio())) //volta para tela anterior
                        )
                  },
                  child: Text("Cancelar"),
                  style: ButtonStyle(
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

  Future<List<task>> getAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var urlApi = apiUrl.URl;

    var api = Uri.parse('${urlApi}/anuncios/');
    var response = await http.get(api, headers: {
      'Accept': 'application/json',
      'Authorization': '$token',
    });
    List<task> list = List<task>.empty(growable: true);
    if (response.statusCode == 200) {
      List lista = jsonDecode(response.body);
      lista.forEach((Element) {
        list.add(task.fromJson(Element));
      });
    }
    return list;
  }

  // List<task> list = List<task>.empty(growable: true);

  Future<bool> adicionar() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var urlApi = apiUrl.URl;

    var api = Uri.parse('$urlApi/anuncios/');
    var response = await http.post(api, headers: {
      'Authorization': '$token',
    });

    if (response.statusCode == 201) {
      print(jsonDecode(response.body));

      return true;
    } else {
      print(jsonDecode(response.body));
      return false;
    }
  }
}
