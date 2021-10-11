import 'dart:convert';
import 'package:http/http.dart' as http;

import 'BaseService.dart';

class UserService {
  static Future<String> createUser(String name, String email, String password,
      String checkPassword, String phone) async {
    var url = BaseService.baseUrl + '/User';
    var params = {
      "name": name,
      "password": password,
      "checkedPassword": checkPassword,
      "email": email,
      "phone": phone
    };
    var body = json.encode(params);
    var header = {'Content-Type': "application/json"};

    var response = await http.post(url, headers: header, body: body);

    if (response.statusCode == 201) {
      return "";
    }
    return "Ocorreu um erro interno tente novamente.";
  }
}
