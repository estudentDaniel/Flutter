import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'UrlAPi.dart' as apiUrl;
import 'Login.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String user = '';
  String phone = '';
  String password = '';

  Future<bool> postar() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var urlApi = apiUrl.URl;
    var api = Uri.parse('${urlApi}/usuario');
    var response = await http.post(
      api,
      body: {
        'nome': userController.text,
        'telefone': emailController.text,
        'email': emailController.text,
        'senha': passwordController.text,
      },
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      print(jsonDecode(response.body));
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: userController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Exemplo: Daniel',
                            isDense: true,
                          ),
                          //onChanged:,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'E-mail:',
                            isDense: true,
                          ),
                          keyboardType: TextInputType.phone,
                          autocorrect: false,
                          //  onChanged: signupStore.setEmail,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextField(
                          controller: passwordController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'senha:',
                            isDense: true,
                          ),
                          keyboardType: TextInputType.text,
                          autocorrect: false,
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Divider(
                          color: Color.fromARGB(255, 143, 143, 143),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (postar() != null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              } else {
                                print("errado");
                              }
                            },
                            child: const Text("Entrar"))
                      ],
                    ),
                  ))),
        ),
      ),
    );
  }
}
