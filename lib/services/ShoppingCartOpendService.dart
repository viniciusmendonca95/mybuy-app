import 'package:app/models/shoppingCart.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'BaseService.dart';

class ShoppingCartOpendService {
  static Future<ShoppingCart> getShoppingCartOpend() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString('token');
    var userId = prefs.getString('userId');

    var url = BaseService.baseUrl + '/ShoppingCartOpend/' + userId;

    var header = {
      'Content-Type': "application/json",
      "Authorization": 'Bearer $token'
    };

    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      var shoppingCartOpend = ShoppingCart.fromJson(result);
      return shoppingCartOpend;
    }
    return null;
  }

  static Future<String> addItemOnCarOpend(String productId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString('token');
    var userId = prefs.getString('userId');

    var url = BaseService.baseUrl + '/ShoppingCartOpend/add-item';
    var params = {"ProductId": productId, "UserId": userId, "Quantity": 1};
    var body = json.encode(params);

    var header = {
      'Content-Type': "application/json",
      "Authorization": 'Bearer $token'
    };

    var response = await http.post(url, headers: header, body: body);
    if (response.statusCode == 200) {
      return null;
    }
    return "Erro ao adicionar produto.";
  }

  static Future<String> removeOnCarOpend(String productId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString('token');
    var userId = prefs.getString('userId');

    var url = BaseService.baseUrl + '/ShoppingCartOpend/remove-item';
    var params = {"ProductId": productId, "UserId": userId, "Quantity": 1};
    var body = json.encode(params);

    var header = {
      'Content-Type': "application/json",
      "Authorization": 'Bearer $token'
    };

    var response = await http.post(url, headers: header, body: body);
    if (response.statusCode == 200) {
      return null;
    }
    return "Erro ao remover produto.";
  }

  static Future<String> closeShoppingCart(String productId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString('token');
    var userId = prefs.getString('userId');

    var url = "${BaseService.baseUrl}/ShoppingCartOpend/close/$userId";
    var header = {
      'Content-Type': "application/json",
      "Authorization": 'Bearer $token'
    };

    var response = await http.post(url, headers: header);

    if (response.statusCode == 200) {
      return null;
    }
    return "Erro ao finalizar compra.";
  }
}
