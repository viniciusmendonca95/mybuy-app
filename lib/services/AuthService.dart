import 'dart:convert';

import 'package:app/models/authentication.dart';
import 'package:http/http.dart' as http;

import 'BaseService.dart';

class AuthService {
  static Future<Authentication> login(String email, String password) async {
    var url = BaseService.baseUrl + '/Auth';

    var params = {"email": email, "password": password};
    var body = json.encode(params);
    var header = {'Content-Type': "application/json"};

    var response = await http.post(url, headers: header, body: body);

    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      var authentication = Authentication.fromJson(result);
      print(authentication.user.id);
      return authentication;
    }
    return null;
  }
}
