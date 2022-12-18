import 'package:appromocao/addAnuncio.dart';
import 'package:appromocao/metodos.dart';
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
  final Methods m = Methods();
  List<task> list = List<task>.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anuncio"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: m.getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            list = snapshot.data!;

            return ListView.separated(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: UniqueKey(),
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
                      title: Text(list[index].titulo!),
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
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) =>
                        AddAnuncio())) //volta para tela anterior
                );
          },
          child: const Icon(Icons.add)),
    );
  }
}
