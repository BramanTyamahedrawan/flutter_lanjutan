import 'package:flutter/material.dart ';
import 'package:flutter_lanjutan/02-HTTP-GET/single-user/get_result_single.dart';

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
  HttpGetSingleResult? httpGetSingleResult;
  // berfungsi untuk menampung data dari API GET yang sudah diubah ke dalam bentuk objek

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP GET Single'),
        backgroundColor: const Color.fromARGB(255, 61, 31, 131),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text((httpGetSingleResult != null)
                ? "ID: ${httpGetSingleResult!.id} | Email: ${httpGetSingleResult!.email} | Name: ${httpGetSingleResult!.name} | Avatar: ${httpGetSingleResult!.avatar}"
                : "Tidak Ada Data"),
            // menampilkan data dari API POST yang sudah diubah ke dalam bentuk objek
            // jika data tidak sama dengan null, maka tampilkan data, jika null maka tampilkan "Tidak Ada Data"
            ElevatedButton(
              onPressed: () {
                HttpGetSingleResult.connectToAPI("5").then((value) {
                  // menghubungkan ke API GET
                  httpGetSingleResult = value;
                  // mengisi variabel httpGetSingleResult dengan data dari API GET yang sudah diubah ke dalam bentuk objek
                  setState(() {});
                  // memanggil fungsi setState untuk membangun ulang widget
                });
              },
              child: const Text('Lihat Data'),
            ),
          ],
        ),
      ),
    );
  }
}
