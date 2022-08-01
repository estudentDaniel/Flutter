import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: homeWidget(),
    );
  }
}

class homeWidget extends StatelessWidget {
  const homeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title:const Text('Posto Ipiranga'),
      ),
      body:const Center(
        child: Text(
          'Deus é fiel',
          textDirection: TextDirection.rtl,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => {
          print('Clicou')
        },
      ),
    );
  }
}
