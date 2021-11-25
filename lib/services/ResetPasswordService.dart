import 'dart:convert';
import 'package:http/http.dart' as http;

import 'BaseService.dart';

class ResetPasswordService {
  static Future<String> resetPassword(String email) async {
    var url = BaseService.baseUrl + '/Auth/PasswordRecovery';
    var params = {"email": email};
    var body = json.encode(params);
    var header = {'Content-Type': "application/json"};

    var response = await http.post(url, headers: header, body: body);

    if (response.statusCode == 200) {
      return "Senha enviada com sucesso!";
    }
    print(email);
    return "Ocorreu um erro interno tente novamente.";
  }
}
