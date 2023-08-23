import 'package:flutter/material.dart ';
import 'package:flutter_lanjutan/02-HTTP-GET/multi-user/get_result_multi.dart';

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
  String? output = "Tidak Ada Data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP GET Multi User'),
        backgroundColor: const Color.fromARGB(255, 61, 31, 131),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(output!),
            ElevatedButton(
              onPressed: () {
                HttpGetMultiResult.getMultiResult("2").then((users) {
                  output = "";
                  for (int i = 0; i < users.length; i++) {
                    output =
                        "${output!}[ ${users[i].id!}. ${users[i].name!}] \n"
                        "[${users[i].email!}] \n\n";
                  }
                  setState(() {});
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
