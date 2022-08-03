import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const Myapp()); //-> faço minha chamada principal
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homewidget(),
    );
  }
}

class Homewidget extends StatelessWidget {
  const Homewidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New app'),
      ),
      body: const Padding(
          padding: EdgeInsets.only(left: 15, right: 15, bottom: 25, top: 155),
          child: TextField(
            
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.money_outlined,
                color: Color.fromARGB(255, 59, 78, 242),
              ),
            ),
            style: TextStyle(
              color: Colors.black,
            ),
          )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
        onPressed: () => {},
      ),
    );
  }
}





























// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: homeWidget(),
//     );
//   }
// }

// class homeWidget extends StatelessWidget {
//   const homeWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//        title:const Text('Posto Ipiranga'),
//       ),
//       body:const Center(
//         child: Text(
//           'Deus é fiel',
//           textDirection: TextDirection.rtl,
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.add),
//         onPressed: () => {
//           print('Clicou')
//         },
//       ),
//     );
//   }
// }
