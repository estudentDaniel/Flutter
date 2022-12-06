//import 'dart:io';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lista_tarefas/home_screnn.dart';
import 'package:lista_tarefas/tarefa.dart';
import 'package:path_provider/path_provider.dart';

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
  String? _image;
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
      body: Column(
        children: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 18),
              width: 125,
              height: 120,
              decoration: BoxDecoration(
                  color: Colors.grey[210],
                  border: Border.all(width: 1, color: Colors.grey),
                  shape: BoxShape.circle),
              child: _image == null
                  ? Icon(Icons.add_a_photo)
                  : CircleAvatar(
                      backgroundImage: FileImage(File(_image!)),
                    ),
            ),
            onTap: () async {
              final ImagePicker picker = ImagePicker();
              final XFile? pickerFile =
                  await picker.pickImage(source: ImageSource.camera);
              if (pickerFile != null) {
                File image = File(pickerFile.path);
                Directory dir = await getApplicationDocumentsDirectory();
                String _localPath = dir.path;
                String uniqueID = UniqueKey().toString();
                final File savedImage =
                    await image.copy('$_localPath/image_$uniqueID.png');

                setState(() {
                  _image = savedImage.path;
                });
              }
            },
          ),
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
                    Task tarefa = new Task(titulo.text, _image);
                    Navigator.pop(context, tarefa);
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
    );
  }
}
