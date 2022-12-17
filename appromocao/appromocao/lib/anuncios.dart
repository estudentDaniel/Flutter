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
      List dadosTask = await json.decode(response.body);
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
        body: ListView.separated(
            itemBuilder: (context, position) {
              task item = _list[position];
              return Dismissible(
                key: UniqueKey(),
                background: Container(
                  color: Color.fromARGB(255, 73, 163, 248),
                ),
                secondaryBackground: Container(
                  color: Colors.blue,
                  child: const Align(
                    alignment: Alignment(0.9, 0.0),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
                onDismissed: (direction) {
                  if (direction == DismissDirection.endToStart) {
                    setState(() {
                      _list.removeAt(position);
                      _list.insert(position, item);
                    });
                  }
                },
                child: ListTile(
                  title: Text(
                    _list[position].id,
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  onTap: () async {
                    setState(() {});
                  },
                  onLongPress: () async {},
                ),
                confirmDismiss: (direction) async {},
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: _list.length));
  }
}
