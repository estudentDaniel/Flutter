import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lista_tarefas/cadastro.dart';
import 'package:lista_tarefas/tarefa.dart';

class Home_screen extends StatefulWidget {
  Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  List<Task> _list = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.separated(
          itemBuilder: (context, position) {
            Task item = _list[position];
            return Dismissible(
                key: UniqueKey(),
                background: Container(
                  color: Colors.green,
                  child: const Align(
                    alignment: Alignment(-0.9, 0.0),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
                secondaryBackground: Container(
                  color: Colors.red,
                  child: const Align(
                    alignment: Alignment(0.9, 0.0),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
                onDismissed: (direction) {
                  if (direction == DismissDirection.endToStart) {
                    setState(() {
                      _list.removeAt(position);
                      _list.insert(position, item);
                    });
                  }
                },
                child: ListTile(
                  title: Text(
                    _list[position].text,
                    style: TextStyle(
                      color: item.done ? Colors.green : Colors.black,
                      decoration: item.done
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      item.done = !item.done;
                    });
                  },
                ));
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: _list.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Task todo = await Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cadastro()));
          setState(() {
            _list.add(todo);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
