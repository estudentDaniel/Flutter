import 'dart:convert';
import 'UrlAPi.dart' as apiUrl;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:appromocao/anuncios.dart';
import 'package:appromocao/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'task.dart';

class PostCasdatro {
  Future<bool> postar() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var urlApi = apiUrl.URl;
    var api = Uri.parse('${urlApi}/usuario/');
    var response = await http.post(
      api,
      body: {
        //  'titulo': titulo.text,
        //    'descricao': descricao.text,
        //   'preco': preco.text,
      },
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      print(jsonDecode(response.body));
      return false;
    }
  }
}
