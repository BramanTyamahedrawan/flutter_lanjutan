import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpPutResult {
  String? name;
  String? job;
  String? updatedAt;

  HttpPutResult({this.name, this.job, this.updatedAt});

  factory HttpPutResult.createPutResult(Map<String, dynamic> object) {
    return HttpPutResult(
      name: object['name'],
      job: object['job'],
      updatedAt: object['updatedAt'],
    );
  }

  static Future<HttpPutResult> connectToAPI(String name, String job) async {
    var apiUrl = Uri.parse("https://reqres.in/api/users/2");
    var apiResult = await http.put(apiUrl, body: {"name": name, "job": job});

    var jsonObject = json.decode(apiResult.body);

    return HttpPutResult.createPutResult(jsonObject);
  }
}
