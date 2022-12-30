import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/Task.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Task> dados = <Task>[];
  TextEditingController nome = TextEditingController();
  TextEditingController sobreNome = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Column(
          //padding: const EdgeInsets.all(10),
          children: [
            TextField(
              controller: nome,
              decoration: const InputDecoration(
                hintText: 'nome',
              ),
            ),
            const SizedBox(),
            TextField(
              controller: sobreNome,
              decoration: const InputDecoration(
                hintText: 'sobre nome',
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Task n = sobreNome as Task;
                    Task s = sobreNome as Task;
                    dados.add(n);
                    dados.add(s);
                    print("Dados: $dados ");
                  });
                },
                child: const Text("Enviar"))
          ]),
    );
  }
}
