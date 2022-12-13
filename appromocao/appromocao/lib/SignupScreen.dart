import 'package:appromocao/signup_store.dart';
import 'package:appromocao/textfiled.dart';
import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

class SignupScreen extends StatelessWidget {
  final SignupStore signupStore = SignupStore();

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
                    Observer(builder: (_) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      );
                    }),
                    FieldTitle(
                      title: 'Apelido',
                      subtitle: 'Como aparecerá em seus anúncios.',
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        //enabled: !signupStore.loading,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Exemplo: João S.',
                          isDense: true,
                        ),
                        onChanged: signupStore.setName,
                      );
                    }),
                    const SizedBox(
                      height: 16,
                    ),
                    FieldTitle(
                      title: 'E-mail',
                      subtitle: 'Enviaremos um e-mail de confirmação.',
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Exemplo: joao@gmail.com',
                          isDense: true,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        onChanged: signupStore.setEmail,
                      );
                    }),
                    const SizedBox(
                      height: 16,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FieldTitle(
                      title: 'Senha',
                      subtitle: 'Use letras, números e caracteres especiais',
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        enabled: !signupStore.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          isDense: true,
                        ),
                        obscureText: true,
                        onChanged: signupStore.setPass1,
                      );
                    }),
                    const SizedBox(
                      height: 16,
                    ),
                    FieldTitle(
                      title: 'Confirmar Senha',
                      subtitle: 'Repita a senha',
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        enabled: !signupStore.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          isDense: true,
                        ),
                        obscureText: true,
                        onChanged: signupStore.setPass2,
                      );
                    }),
                    Observer(builder: (_) {
                      return Container(
                        height: 40,
                        margin: const EdgeInsets.only(top: 20, bottom: 12),
                        child: ElevatedButton(
                          //color: Colors.orange,
                          // disabledColor: Colors.orange.withAlpha(120),
                          child: signupStore.loading
                              ? CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                )
                              : Text('CADASTRAR'),
                          // textColor: Colors.white,
                          //  elevation: 0,
                          // shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(20)
                          // ),
                          onPressed: signupStore.signUpPressed,
                        ),
                      );
                    }),
                    Divider(
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Já tem uma conta? ',
                            style: TextStyle(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: Navigator.of(context).pop,
                            child: Text(
                              'Entrar',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.purple,
                                fontSize: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// import 'package:appromocao/signup_store.dart';
// import 'package:appromocao/textfiled.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter_mobx/flutter_mobx.dart';

// class SignupScreen extends StatelessWidget {
//   final SignupStore signupStore = SignupStore();

//   SignupScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Cadastro"),
//         centerTitle: true,
//       ),
//       body: Container(
//         alignment: Alignment.center,
//         child: SingleChildScrollView(
//           padding: EdgeInsets.only(bottom: 5),
//           child: Card(
//             margin: EdgeInsets.symmetric(horizontal: 32),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(18),
//             ),
//             child: Padding(
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   FieldTitle(title: "Name", subtitle: "Sobre seu nome"),
//                   Observer(
//                     builder: (_) {
//                       return TextField(
//                         enabled: !signupStore.loading,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                           hintText: "ex: daniel de castro",
//                         ),
//                         onChanged: signupStore.setName,
//                       );
//                     },
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   FieldTitle(title: "Email", subtitle: "Sobre seu email"),
//                   Observer(builder: (_) {
//                     return TextField(
//                       enabled: !signupStore.loading,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         hintText: "ex: daniel@exemple.com",
//                       ),
//                       keyboardType: TextInputType.emailAddress,
//                       autocorrect: false,
//                       //  onChanged: signupStore.setemail,
//                     );
//                   }),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   FieldTitle(title: "Senha", subtitle: "Sua senha"),
//                   Observer(builder: (_) {
//                     return TextField(
//                       enabled: !signupStore.loading,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         hintText: "ex: 12345678",
//                       ),
//                       obscureText: true,
//                       // onChanged: signupStore.setSenha,
//                     );
//                   }),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   FieldTitle(
//                       title: "Confirmar senha",
//                       subtitle: "Confirmar sua senha"),
//                   Observer(builder: (_) {
//                     return TextField(
//                       enabled: !signupStore.loading,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         hintText: "ex:12345678",
//                       ),
//                       obscureText: true,
//                       // onChanged: signupStore.setSenha2,
//                     );
//                   }),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   const Padding(padding: EdgeInsets.all(5)),
//                   Divider(),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   Observer(builder: (context) {
//                     return Container(
//                       height: 40,
//                       child: ElevatedButton(
//                           child: Text(
//                             "Cadastrar",
//                           ),
//                           onPressed: () {
//                             signupStore.signUpPressed;
//                             print(' dados: ${signupStore.signUpPressed}  ');
//                           }),
//                     );
//                   }),
//                   const Padding(padding: EdgeInsets.all(8)),
//                   Wrap(
//                     alignment: WrapAlignment.center,
//                     children: <Widget>[
//                       GestureDetector(
//                         child: const Text(
//                           "Já tenho conta! Entrar",
//                           style: TextStyle(
//                               color: Color.fromARGB(197, 210, 10, 10)),
//                         ),
//                         onTap: Navigator.of(context).pop,
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
