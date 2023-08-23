import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpDeleteResult {
  String? id;
  String? name;
  String? job;
  String? createdAt;

  HttpDeleteResult({this.id, this.name, this.job, this.createdAt});

  factory HttpDeleteResult.createDeleteResult(Map<String, dynamic> object) {
    return HttpDeleteResult(
      id: object['id'].toString(),
      name: object['name'],
      job: object['job'],
      createdAt: object['createdAt'],
    );
  }

  static Future<HttpDeleteResult> connectToAPI(String id) async {
    var apiUrl = Uri.parse("https://reqres.in/api/users/$id");
    var apiResult = await http.delete(apiUrl);

    var jsonObject = json.decode(apiResult.body);

    return HttpDeleteResult.createDeleteResult(jsonObject);
  }
}
