import 'package:appromocao/Cabecalho.dart';
import 'package:appromocao/pagina_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

//customdrawer
class TaskDrawer extends StatelessWidget {
  const TaskDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:
          MediaQuery.of(context).size.width * 0.6, //define minha tela lateral
      child: Drawer(
        child: ListView(
          children: [CustomHeader(), PageSection()],
        ),
      ),
    );
  }
}
