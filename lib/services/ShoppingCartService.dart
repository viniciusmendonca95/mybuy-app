import 'package:app/models/shoppingCart.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'BaseService.dart';

class ShoppingCartService {
  static Future<List<ShoppingCart>> getHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString('token');
    var userId = prefs.getString('userId');

    var url = BaseService.baseUrl + '/ShoppingCart/' + userId;

    var header = {
      'Content-Type': "application/json",
      "Authorization": 'Bearer $token'
    };

    var response = await http.get(url, headers: header);
    final shoppingCarts = List<ShoppingCart>();
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      for (Map map in result) {
        shoppingCarts.add(ShoppingCart.fromJson(map));
      }
    }
    return shoppingCarts;
  }
}
