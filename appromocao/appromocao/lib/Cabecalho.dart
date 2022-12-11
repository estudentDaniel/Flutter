import 'dart:html';

import 'package:appromocao/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => LoginScreen()));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 90,
        color: Colors.blue,
        child: Row(children: [
          Icon(Icons.person, color: Colors.white, size: 35),
          SizedBox(
            width: 20,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Acessar conta",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "Entrar",
                style: TextStyle(color: Colors.white),
              )
            ],
          ))
        ]),
      ),
    );
  }
}
