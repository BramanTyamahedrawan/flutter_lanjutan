import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpGetSingleResult {
  String? id;
  String? email;
  String? name;
  String? avatar;

  HttpGetSingleResult({this.id, this.email, this.name, this.avatar});

  factory HttpGetSingleResult.createGetSingleResult(
      Map<String, dynamic> object) {
    return HttpGetSingleResult(
      id: object['id'].toString(),
      email: object['email'],
      name: object['first_name'] + " " + object['last_name'],
      avatar: object['avatar'],
    );
  }

  static Future<HttpGetSingleResult> connectToAPI(String id) async {
    var apiUrl = Uri.parse("https://reqres.in/api/users/$id");
    var apiResult = await http.get(apiUrl);

    var jsonObject = json.decode(apiResult.body);

    return HttpGetSingleResult.createGetSingleResult(jsonObject['data']);
  }
}
