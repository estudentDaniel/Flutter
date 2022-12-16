import 'dart:convert';

import 'package:appromocao/anuncios.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'UrlAPi.dart' as apiUrl;

class Login extends StatelessWidget {
  final userController = TextEditingController();
  final passwordController = TextEditingController();

  Future<bool> entrar() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var urlApi = apiUrl.URl;
    var api = Uri.parse('${urlApi}/login');
    var response = await http.post(
      api,
      body: {
        'email': userController.text,
        'senha': passwordController.text,
      },
    );
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      prefs.setString('token', res['token']);
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
          title: Text("login"),
          centerTitle: true,
        ),
        body: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
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
                                hintText: "USUARIO:",
                                isDense: true,
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextField(
                              controller: passwordController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'SENHA:',
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
                                onPressed: () async {
                                  bool response = await entrar();

                                  if (response) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Anuncio()));
                                  } else {
                                    print('errado');
                                  }
                                },
                                child: const Text("Entrar"))
                          ],
                        ),
                      ))),
            )));
  }
}
