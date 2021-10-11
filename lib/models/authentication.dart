import 'package:app/models/user.dart';

class Authentication {
  User user;
  String token;
  String permission;

  Authentication({this.user, this.token, this.permission});

  Authentication.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
    permission = json['permission'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['token'] = this.token;
    data['permission'] = this.permission;
    return data;
  }
}