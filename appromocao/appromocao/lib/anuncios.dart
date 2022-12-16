import 'package:flutter/material.dart';

class Anuncio extends StatefulWidget {
  const Anuncio({super.key});

  @override
  State<Anuncio> createState() => _AnuncioState();
}

class _AnuncioState extends State<Anuncio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anuncio"),
      ),
      // body: ListView.separated(
      //   itemBuilder: (context, index) {},
      //   separatorBuilder: () => (),
      //   itemCount: 0,
      // ),
    );
  }
}
