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
    // getMultiResult() berfungsi untuk mengambil data dari API menggunakan HTTP GET Request dengan parameter page
    String apiURL = "https://reqres.in/api/users?page=$page";
    var apiResult = await http.get(Uri.parse(apiURL));
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> listUser = (jsonObject as Map<String, dynamic>)['data'];
    // List<dinamic> listUser = (jsonObject['data'] as Map<String, dynamic>)['data']; berfungsi untuk mengambil data dari jsonObject
    // List<dynamic> listUser = jsonObject['data']; // Cara lain untuk mendapatkan data dari jsonObject

    List<HttpGetMultiResult> users = [];
    // Looping untuk mengambil data dari listUser
    for (int i = 0; i < listUser.length; i++) {
      users.add(HttpGetMultiResult.createGetMultiResult(listUser[i]));
    } // looping dilakukan sebanyak jumlah data yang ada di listUser
    return users;
  }
}
