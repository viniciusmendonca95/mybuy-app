import 'package:app/models/category.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'BaseService.dart';

class CategoryService {
  static Future<List<Category>> getCategories() async {
    var url = BaseService.baseUrl + '/category';

    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString('token');

    var header = {
      'Content-Type': "application/json",
      "Authorization": 'Bearer $token'
    };

    var response = await http.get(url, headers: header);
    var result = json.decode(response.body);

    final categories = List<Category>();

    if (response.statusCode == 200) {
      for (Map map in result) {
        categories.add(Category.fromJson(map));
      }
    }

    return categories;
  }

  static Future<String> createCategory(String name, String description) async {
    var url = BaseService.baseUrl + '/category';

    var params = {"name": name, "description": description};
    var body = json.encode(params);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString('token');

    var header = {
      'Content-Type': "application/json",
      "Authorization": 'Bearer $token'
    };

    var response = await http.post(url, headers: header, body: body);

    if (response.statusCode == 201) {
      return "Categoria cadastrada com sucesso.";
    } else if (response.statusCode == 401 || response.statusCode == 403) {
      return "Voce não tem permissão para esta função";
    } else {
      return "Ocorreu um erro. Tente novamente.";
    }
  }

  static Future<String> updateCategory(
      String id, String name, String description) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString('token');

    var url = BaseService.baseUrl + '/Category';

    var header = {
      'Content-Type': "application/json",
      "Authorization": 'Bearer $token'
    };

    var params = {
      "id": id,
      "name": name,
      "description": description,
    };
    var body = json.encode(params);

    var response = await http.put(url, headers: header, body: body);

    if (response.statusCode == 200) {
      return "Categoria alterada com sucesso.";
    } else if (response.statusCode == 401 || response.statusCode == 403) {
      return "Voce não tem permissão para esta função";
    } else {
      return "Ocorreu um erro tente novamente.";
    }
  }
}
