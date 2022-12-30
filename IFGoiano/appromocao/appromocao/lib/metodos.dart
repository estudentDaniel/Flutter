import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'UrlAPi.dart' as apiUrl;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'task.dart';

class Methods {
  //--------------------------------------------------------------
  Future<List<task>> getAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var urlApi = apiUrl.URl;

    var api = Uri.parse('${urlApi}/anuncios/');
    var response = await http.get(api, headers: {
      'Accept': 'application/json',
      'Authorization': '$token',
    });

    List<task> list = await List<task>.empty(growable: true);
    if (response.statusCode == 200) {
      List lista = jsonDecode(response.body);
      lista.forEach((Element) {
        list.add(task.fromJson(Element));
      });
    }
    return list;
  }

  //------------------------------------------------------------------------
  Future<task> adicionar(task addAnun) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var urlApi = apiUrl.URl;

    var api = Uri.parse('${urlApi}/anuncios/');
    var response = await http.post(api,
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: toJson(addAnun));

    if (response.statusCode == 201) {
      task addAnun = addfromJson(response.body);
      return addAnun;
    } else {
      Exception("quebro");
    }
    return addAnun;
  }
}
