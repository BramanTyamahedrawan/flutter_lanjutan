import 'package:flutter/material.dart ';
import 'package:flutter_lanjutan/01-HTTP-post/post_result.dart';

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
  HttpPostResult? httpPostResult = null;

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
            Text((httpPostResult != null)
                ? "${httpPostResult!.id} | ${httpPostResult!.name} | ${httpPostResult!.job} | ${httpPostResult!.createdAt}"
                : "Tidak Ada Data"),
            ElevatedButton(
              onPressed: () {
                HttpPostResult.connectToAPI("Braman", "Programmer")
                    .then((value) {
                  httpPostResult = value;
                  setState(() {});
                });
              },
              child: const Text('Kirim Data'),
            ),
          ],
        ),
      ),
    );
  }
}
