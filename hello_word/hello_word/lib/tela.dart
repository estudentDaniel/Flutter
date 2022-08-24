import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class TelaHelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deus é fiel"),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "ola",
          style: TextStyle(),
        ),
      ),
    );
  }
}
