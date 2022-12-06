import 'package:appromocao/home_screen_lateral.dart';
import 'package:appromocao/page_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobx/mobx.dart';

class _HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = new PageController();
  final PageStore pageStore = PageStore();

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
