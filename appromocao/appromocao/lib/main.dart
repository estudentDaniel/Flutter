import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:appromocao/page_store.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParser();
  setupLocations();
  runApp(MyApp());
}

void setupLocations() {
  GetIt.I.registerSingleton(PageStore());
}

Future<void> initializeParser() async {
  await Parse().initialize(
    'Q4GiMgtiVwrKjMUhkMXy4HGSvxJY6THynn0ulN4i',
    'https://parseapi.back4app.com/',
    clientKey: 'Mg6Ts8y8rGp0DxZL2UHXk8cCNP2Po63x50I87UkQ',
    autoSendSessionId: true,
    debug: true,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CompreAqui",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Color.fromARGB(255, 234, 242, 248),
      ),
      home: HomeScreen(),
    );
  }
}
