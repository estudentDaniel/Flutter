import 'package:appromocao/SignupScreen.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 25),
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(padding: EdgeInsets.all(10)),
                Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 17, color: Color.fromARGB(255, 31, 31, 31)),
                  ),
                ),
                Divider(),
                const Padding(
                  padding: EdgeInsets.only(left: 3, bottom: 4, top: 8),
                  child: Text(
                    "Email",
                    style: TextStyle(
                        fontSize: 17, color: Color.fromARGB(255, 16, 16, 16)),
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    isDense: true,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 3, bottom: 4, top: 8),
                  child: Text(
                    "Senha",
                    style: TextStyle(
                        fontSize: 17, color: Color.fromARGB(255, 16, 16, 16)),
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                  obscureText: true,
                ),
                const Padding(padding: EdgeInsets.all(5)),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 40,
                  child: ElevatedButton(
                    child: Text(
                      "Entrar",
                    ),
                    onPressed: (() {
                      print("entart");
                    }),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(8)),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child: const Text(
                        "Cadastre-se",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: (() {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => SignupScreen()));
                      }),
                    )
                  ],
                ),
                const Padding(padding: EdgeInsets.all(8)),
                GestureDetector(
                  child: const Text(
                    "Esqueceu sua senhaa?",
                    style: TextStyle(color: Color.fromARGB(190, 223, 19, 39)),
                  ),
                  onTap: (() {}),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
