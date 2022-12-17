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
    var token = prefs.getString('token');
    var urlApi = apiUrl.URl;

    var api = Uri.parse('${urlApi}/anuncios/');
    var response = await http.get(api, headers: {
      'Accept': 'application/json',
      'Authorization': '$token',
    });
    List<task> _lists = List<task>.empty(growable: true);
    if (response.statusCode == 200) {
      List lista = jsonDecode(response.body);
      lista.forEach((Element) {
        _list.add(task.fromJson(Element));
      });
    }
    return _list;
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
      body: FutureBuilder(
        future: getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var item = snapshot.data![index];

                  return Dismissible(
                    key: Key(item.id[index]),
                    onDismissed: (DismissDirection dir) async {},
                    background: Container(
                      color: Color.fromARGB(255, 49, 151, 240),
                      alignment: Alignment.centerLeft,
                    ),
                    secondaryBackground: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
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
              child: Text('quebrou aqui'),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
