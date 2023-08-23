import 'package:flutter/material.dart ';

import 'package:flutter_lanjutan/04-HTTP-DELETE/delete_result.dart';

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
  HttpDeleteResult? httpDeleteResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP DELETE'),
        backgroundColor: const Color.fromARGB(255, 61, 31, 131),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              (httpDeleteResult != null)
                  ? "${httpDeleteResult!.name} | ${httpDeleteResult!.job} | ${httpDeleteResult!.createdAt}"
                  : "Tidak Ada Data",
            ),
            ElevatedButton(
              onPressed: () {
                HttpDeleteResult.connectToAPI("2").then((value) {
                  httpDeleteResult = value;
                  setState(() {});
                });
              },
              child: const Text('Hapus Data'),
            ),
          ],
        ),
      ),
    );
  }
}
