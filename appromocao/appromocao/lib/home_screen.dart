import 'package:appromocao/home_screen_lateral.dart';
import 'package:appromocao/page_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';
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
  final PageController pageController = new PageController();
  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reaction((_) => pageStore.page, (page) => pageController.jumpToPage(page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(), //bloqueando dismissible
        controller: pageController,
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
