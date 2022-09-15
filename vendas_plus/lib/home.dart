import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Vendas plus+",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(255, 152, 150, 150),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              height: 150,
              width: 300,
              color: Colors.blue,
            ),
            Container(
              height: 150,
              width: 300,
              color: Color.fromARGB(255, 33, 243, 89),
            ),
            Container(
              height: 150,
              width: 300,
              color: Color.fromARGB(255, 243, 33, 51),
            ),
            Container(
              height: 150,
              width: 300,
              color: Color.fromARGB(255, 86, 33, 243),
            ),
          ],
        ),
      ),
    );
  }
}
