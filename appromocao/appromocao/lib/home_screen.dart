import 'package:appromocao/home_screen_lateral.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobx/mobx.dart';

class HomeScreen extends StatelessWidget {
  final PageController _pageController = new PageController();
  //final Store pageStore = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(), //bloqueando dismissible
        controller: _pageController,
        children: [
          HomeScreenLateral(),
          Container(color: Colors.red),
          Container(color: Colors.green),
          Container(color: Colors.purple),
          Container(color: Colors.white),
        ],
      ),
    );
  }
}
