import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpGetMultiResult {
  String? id;
  String? email;
  String? name;
  String? avatar;

  HttpGetMultiResult({this.id, this.email, this.name, this.avatar});

  factory HttpGetMultiResult.createGetMultiResult(Map<String, dynamic> object) {
    return HttpGetMultiResult(
      id: object['id'].toString(),
      email: object['email'],
      name: object['first_name'] + " " + object['last_name'],
      avatar: object['avatar'],
    );
  }

  static Future<List<HttpGetMultiResult>> getMultiResult(var page) async {
    String apiURL = "https://reqres.in/api/users?page=$page";
    var apiResult = await http.get(Uri.parse(apiURL));
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> listUser = (jsonObject as Map<String, dynamic>)['data'];

    List<HttpGetMultiResult> users = [];
    for (int i = 0; i < listUser.length; i++) {
      users.add(HttpGetMultiResult.createGetMultiResult(listUser[i]));
    }
    return users;
  }
}
