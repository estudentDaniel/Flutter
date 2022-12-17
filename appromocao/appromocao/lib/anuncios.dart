import 'package:shared_preferences/shared_preferences.dart';
import 'UrlAPi.dart' as apiUrl;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'task.dart';

class Anuncio extends StatefulWidget {
  const Anuncio({super.key});

  @override
  State<Anuncio> createState() => _AnuncioState();
}

class _AnuncioState extends State<Anuncio> {
  late Future<List<task>> list;

  List<task> _list = List<task>.empty(growable: true);

  Future<List<task>> getAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<task> tasks = List.empty(growable: true);

    var token = prefs.getString('token');
    var urlApi = apiUrl.URl;
    var api = Uri.parse('${urlApi}/anuncios');
    var response = await http.get(api, headers: {
      'Accept': 'application/json',
      'Authorization': '$token',
    });

    if (response.statusCode == 200) {
      // List tarefa = json.decode(response.body);
      List<Map> dadosTask = await json.decode(response.body);
      dadosTask.forEach((element) {
        _list.add(task.fromMap(element));
      });
      // for (Map task in dadosTask) {
      //   tasks.add(task.fromMap(task));
      // }
    }
    return tasks;
  }

  @override
  void initState() {
    super.initState();
    getAll().then((data) => {
          setState(() {
            _list = data;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anuncio"),
      ),

      body: FutureBuilder<List<task>>(
        future: getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final item = snapshot.data![index];

                  return Dismissible(
                    key: Key(item.id[index]),
                    onDismissed: (DismissDirection dir) async {
                      if (dir == DismissDirection.startToEnd) {}
                    },
                    background: Container(
                      color: Color.fromARGB(255, 49, 151, 240),
                      alignment: Alignment.centerLeft,
                      child: const Icon(Icons.update),
                    ),
                    secondaryBackground: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      child: const Icon(Icons.delete),
                    ),
                    child: ListTile(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      title: Text(item.id),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                });
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('quebrou'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),

      // body: FutureBuilder<List>(
      //     future: obterAnuncio(),
      //     builder: (context, snapshot) {
      //       return ListView.builder(
      //           itemCount: snapshot.data!.length,
      //           itemBuilder: (context, index) {
      //             if (snapshot.hasData) {
      //               return ListTile(
      //                 title: Text(snapshot.data![index].id),
      //               );
      //             } else if (snapshot.hasError) {
      //               print("Quebrou aqui");
      //             }
      //             return CircularProgressIndicator();
      //           });
      //     })
    );
  }
}
