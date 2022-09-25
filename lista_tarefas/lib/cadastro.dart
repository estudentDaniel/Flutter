import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lista_tarefas/home_screnn.dart';

class Cadastro extends StatefulWidget {
  Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController titulo = new TextEditingController();
  final TextEditingController descricao = new TextEditingController();
  String nome = "";
  void _functionCadastro() {
    setState(() {
      nome = titulo.text.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 254, 254, 255),
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
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
              TextFormField(
                decoration: const InputDecoration(
                  label: Text(
                    "Descrição",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blue,
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
                      onPressed: Navigator.of(context).push(
                          MaterialPageRoute(builder: () => Home_screen())),
                      child: Text("Adicionar"),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => {},
                      child: Text("Cancelar"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Center(
                  child: Text("Valor: $nome"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
