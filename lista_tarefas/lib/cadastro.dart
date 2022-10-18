//import 'dart:io';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:flutter/src/widgets/container.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:lista_tarefas/home_screnn.dart';
import 'package:lista_tarefas/tarefa.dart';

class Cadastro extends StatefulWidget {
  // Cadastro({super.key});
  Task? task;
  Cadastro({this.task});
  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController titulo = new TextEditingController();
  final TextEditingController descricao = new TextEditingController();
  File? _image;
  String nome = "";

  void initState() {
    super.initState();
    if (widget.task != null) {
      setState(() {
        titulo.text = widget.task!.text!;
        _image = widget.task!.image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 254, 254, 255),
        appBar: AppBar(
          title: Text("Cadastro"),
        ),
        body: Column(children: [
          GestureDetector(
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(
                      width: 1, color: Color.fromARGB(255, 54, 53, 53)),
                  shape: BoxShape.circle,
                ),
                child: _image == null
                    ? Icon(
                        Icons.add_a_photo,
                        size: 30,
                      )
                    : ClipOval(
                        child: Image.file(_image!),
                      )),
            onTap: () async {
              final ImagePicker picker = ImagePicker();
              final XFile? pickedFile =
                  await picker.pickImage(source: ImageSource.camera);
              if (pickedFile != null) {
                setState(() {
                  _image = File(pickedFile.path);
                });
              }
            },
          ),
          Form(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(8)),
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
                Padding(padding: EdgeInsets.all(8)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.all(8)),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (widget.task == null) {
                            Task tarefa = new Task(titulo.text, _image);
                            Navigator.pop(context, tarefa);
                          } else {
                            print("Errooooo");
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
                                      Home_screen())) //volta para tela anterior
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
              ],
            ),
          ),
        ]));
  }
}
