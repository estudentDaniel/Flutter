import 'dart:js_util';

import 'package:appromocao/signup_store.dart';
import 'package:appromocao/textfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class SignupScreen extends StatelessWidget {
  late SignupStore signupStore = SignupStore();

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 5),
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FieldTitle(title: "Name", subtitle: "Sobre seu nome"),
                  Observer(
                    builder: (_) {
                      return TextField(
                        enabled: !signupStore.loading,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "ex: daniel de castro",
                        ),
                        onChanged: signupStore.setName,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FieldTitle(title: "Email", subtitle: "Sobre seu email"),
                  Observer(builder: (_) {
                    return TextField(
                      enabled: !signupStore.loading,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "ex: daniel@exemple.com",
                      ),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      onChanged: signupStore.setemail,
                    );
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                  FieldTitle(title: "Senha", subtitle: "Sua senha"),
                  Observer(builder: (_) {
                    return TextField(
                      enabled: !signupStore.loading,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "ex: 12345678",
                      ),
                      obscureText: true,
                      // onChanged: signupStore.setSenha,
                    );
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                  FieldTitle(
                      title: "Confirmar senha",
                      subtitle: "Confirmar sua senha"),
                  Observer(builder: (_) {
                    return TextField(
                      enabled: !signupStore.loading,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "ex:12345678",
                      ),
                      obscureText: true,
                      onChanged: signupStore.setSenha2,
                    );
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  Divider(),
                  SizedBox(
                    height: 16,
                  ),
                  Observer(builder: (_) {
                    return Container(
                      height: 40,
                      child: ElevatedButton(
                          child: signupStore.loading
                              ? CircularProgressIndicator()
                              : Text(
                                  "Cadastrar",
                                ),
                          onPressed: signupStore.signupPressed),
                    );
                  }),
                  const Padding(padding: EdgeInsets.all(8)),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        child: const Text(
                          "Já tenho conta! Entrar",
                          style: TextStyle(
                              color: Color.fromARGB(197, 210, 10, 10)),
                        ),
                        onTap: Navigator.of(context).pop,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
