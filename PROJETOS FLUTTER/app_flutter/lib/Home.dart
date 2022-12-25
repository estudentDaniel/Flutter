import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'lista.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Task> list = List.empty(growable: true);

  @override
  void initState() {
    // TODO: implement initState

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of Renderers"),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            Task item = list[index];
            return Container(
                color: Color.fromARGB(255, 57, 145, 228),
                child: ListTile(
                  title: Text(list[index].name +
                      " " +
                      list[index].lastName +
                      " " +
                      list[index].year),
                ));
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: list.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("item: $list");

          setState(() {
            list.add(Task('', '', ''));
          });
        },
        child: Text("Mostar"),
      ),
    );
  }
}
