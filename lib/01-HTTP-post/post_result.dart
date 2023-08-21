import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpPostResult {
  String? id;
  String? name;
  String? job;
  String? createdAt;

  HttpPostResult({this.id, this.name, this.job, this.createdAt});

  factory HttpPostResult.createPostResult(Map<String, dynamic> object) {
    return HttpPostResult(
      id: object['id'],
      name: object['name'],
      job: object['job'],
      createdAt: object['createdAt'],
    );
  }

  static Future<HttpPostResult> connectToAPI(String name, String job) async {
    var apiUrl = Uri.parse("https://reqres.in/api/users");
    var apiResult = await http.post(apiUrl, body: {"name": name, "job": job});

    var jsonObject = json.decode(apiResult.body);

    return HttpPostResult.createPostResult(jsonObject);
  }
}
