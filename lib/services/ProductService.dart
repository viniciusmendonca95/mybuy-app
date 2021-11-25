import 'package:app/models/product.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'BaseService.dart';

class ProductService {
  static Future<List<Product>> getProducts() async {
    var url = BaseService.baseUrl + '/Product';

    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString('token');

    var header = {
      'Content-Type': "application/json",
      "Authorization": 'Bearer $token'
    };

    var response = await http.get(url, headers: header);

    var result = json.decode(response.body);

    final products = List<Product>();
    if (response.statusCode == 200) {
      for (Map map in result) {
        products.add(Product.fromJson(map));
      }
    }
    return products;
  }

  static Future<String> createProduct(
      String name,
      String description,
      String categoryId,
      int price,
      int quantity,
      int warrantyTime,
      int weight) async {
    var url = BaseService.baseUrl + '/Product';

    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString('token');

    var header = {
      'Content-Type': "application/json",
      "Authorization": 'Bearer $token'
    };

    var params = {
      "name": name,
      "description": description,
      "categoryId": "65d2f337-726a-4e56-9a4f-c63e574dd0a0",
      "price": price * 100,
      "quantity": quantity,
      "warrantyTime": warrantyTime,
      "weight": weight,
      "photos": ["teste", "teste"]
    };
    var body = json.encode(params);

    var response = await http.post(url, headers: header, body: body);

    if (response.statusCode == 201) {
      return "Produto cadastrado com sucesso.";
    } else if (response.statusCode == 401 || response.statusCode == 403) {
      return "Voce não tem permissão para esta função";
    } else {
      return "Ocorreu um erro tente novamente.";
    }
  }

  static Future<String> updateProduct(
      String id,
      String name,
      String description,
      String categoryId,
      int price,
      int quantity,
      int warrantyTime,
      int weight) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString('token');

    var url = BaseService.baseUrl + '/Product';

    var header = {
      'Content-Type': "application/json",
      "Authorization": 'Bearer $token'
    };

    var params = {
      "id": id,
      "name": name,
      "description": description,
      "categoryId": "65d2f337-726a-4e56-9a4f-c63e574dd0a0",
      "price": price * 100,
      "quantity": quantity,
      "warrantyTime": warrantyTime,
      "weight": weight,
      "photos": ["teste", "teste"]
    };
    var body = json.encode(params);

    var response = await http.put(url, headers: header, body: body);

    if (response.statusCode == 200) {
      return "Produto alterado com sucesso.";
    } else if (response.statusCode == 401 || response.statusCode == 403) {
      return "Voce não tem permissão para esta função";
    } else {
      return "Ocorreu um erro tente novamente.";
    }
  }
}
