import 'package:flutter/material.dart ';
import 'package:flutter_lanjutan/03-HTTP-PUT/put_result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HttpPutResult? httpPutResult; // berfungsi untuk menampung data dari API

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP POST'),
        backgroundColor: const Color.fromARGB(255, 61, 31, 131),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              (httpPutResult != null)
                  ? "${httpPutResult!.name} | ${httpPutResult!.job} | ${httpPutResult!.updatedAt}"
                  : "Tidak Ada Data",
              // logika di atas berfungsi untuk menampilkan data dari API jika data sudah berhasil dikirim ke API
            ),
            ElevatedButton(
              onPressed: () {
                HttpPutResult.connectToAPI("Braman", "Programmer")
                    // HttpPutResult.connectToAPI("Braman", "Programmer") berfungsi untuk mengirim data ke API
                    .then((value) {
                  // then() berfungsi untuk menampung data yang dikirim dari API
                  httpPutResult = value;
                  // httpPutResult = value; berfungsi untuk menampung data yang dikirim dari API
                  setState(() {});
                });
              },
              child: const Text('Ubah Data'),
            ),
          ],
        ),
      ),
    );
  }
}
