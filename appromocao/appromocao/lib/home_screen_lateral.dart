import 'package:appromocao/talksC.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreenLateral extends StatelessWidget {
  const HomeScreenLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TaskDrawer(),
      appBar: AppBar(),
    );
  }
}
