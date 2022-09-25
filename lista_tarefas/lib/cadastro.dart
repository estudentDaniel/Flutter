import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      
      Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              label: Text("tarefa"),
              labelStyle: TextStyle(fontSize: 20),
            ),
            validator: ()
          )
        ],
      ),
      ),
      ),
      
    );
  }
}
