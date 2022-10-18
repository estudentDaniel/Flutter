import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lista_tarefas/cadastro.dart';
import 'package:lista_tarefas/tarefa.dart';
import 'taksHelper.dart';

class Home_screen extends StatefulWidget {
  Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  List<Task> _list = List.empty(growable: true);
  TaksHelper _taksHelper = TaksHelper();

  @override
  void initState() {
    super.initState();
    _taksHelper.getAll().then((data) => {
          setState(() {
            _list = data;
          })
        });
  }

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
                color: Colors.red,
                child: const Align(
                  alignment: Alignment(-0.9, 0.0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
              secondaryBackground: Container(
                color: Colors.blue,
                child: const Align(
                  alignment: Alignment(0.9, 0.0),
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
              ),
              onDismissed: (direction) async {
                if (direction == DismissDirection.endToStart) {
                  int? qtd = await _taksHelper.delete(item);
                  if (qtd != null && qtd > 0) {
                    setState(() {
                      _list.removeAt(position);
                      _list.insert(position, item);
                    });
                  }
                }
              },
              child: ListTile(
                leading: item.image != null
                    ? CircleAvatar(
                        backgroundImage: FileImage(File(item.image!)),
                      )
                    // ? CircleAvatar(
                    //     child: ClipOval(child: FileImage(File(item.image))),
                    //   )
                    : SizedBox(),
                title: Text(
                  _list[position].text!,
                  style: TextStyle(
                    color: item.done ? Colors.green : Colors.black,
                    decoration: item.done
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                onTap: () async {
                  setState(() {
                    item.done = !item.done;
                  });
                },
                onLongPress: () async {
                  Task edit = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Cadastro(task: item)));

                  setState(() {
                    _list.removeAt(position);
                    _list.insert(position, edit);
                  });
                },
              ),
              confirmDismiss: (direction) async {
                if (direction == DismissDirection.endToStart) {
                  Task? edit = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Cadastro(task: item)));
                  if (edit != null) {
                    int? qtd = await _taksHelper.edit(edit);
                    if (qtd != null && qtd > 0) {
                      setState(() {
                        _list.removeAt(position);
                        _list.insert(position, edit);
                      });
                    }
                  }

                  return false;
                } else if (direction == DismissDirection.endToStart) {
                  return true;
                }
              },
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: _list.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Task? todo = await Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cadastro()));
          if (todo != null) {
            Task? taskSaved = await _taksHelper.save(todo);
            if (taskSaved != null) {
              setState(() {
                _list.add(taskSaved);
              });
            }
          }
          //
          //if (taskSaved != null) {

          //  }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
