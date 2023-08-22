import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpPostResult {
  // class untuk menampung data dari API POST yang sudah diubah ke dalam bentuk objek
  String? id; // tanda tanya (?) artinya bisa null
  String? name;
  String? job;
  String? createdAt;

  HttpPostResult({this.id, this.name, this.job, this.createdAt}); // constructor

  factory HttpPostResult.createPostResult(Map<String, dynamic> object) {
    // method untuk mengubah data dari API POST ke dalam bentuk objek
    return HttpPostResult(
      // mengisi variabel yang ada di class HttpPostResult
      id: object['id'],
      // object['id'] artinya mengambil data dari API POST dengan key 'id'
      // key berbentuk string, value berbentuk dynamic
      name: object['name'],
      job: object['job'],
      createdAt: object['createdAt'],
    );
  }

  static Future<HttpPostResult> connectToAPI(String name, String job) async {
    // method untuk menghubungkan ke API POST
    var apiUrl = Uri.parse("https://reqres.in/api/users"); // URL API POST
    var apiResult = await http.post(apiUrl, body: {"name": name, "job": job});
    // mengirim data ke API POST
    // body: {"name": name, "job": job} artinya mengirim data ke API POST dengan key 'name' dan 'job'
    // await berfungsi untuk menunggu sampai data dari API POST didapatkan

    var jsonObject = json.decode(apiResult.body);
    // mengubah data dari API POST ke dalam bentuk JSON

    return HttpPostResult.createPostResult(jsonObject);
    // mengubah data dari API POST ke dalam bentuk objek
  }
}
