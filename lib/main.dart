import 'dart:math';

import 'package:flutter/material.dart';

//ADDED message
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Pract3'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Random random = Random();
  int randomNumber = 300;
  String path = '';

  @override
  void initState() {
    setState(() {
      path = 'https://picsum.photos/$randomNumber';
    });
    super.initState();
  }

  void rand() {
    setState(() {
      randomNumber = random.nextInt(200) + 300;
      path = 'https://picsum.photos/$randomNumber';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => dialogBuilder(context, path),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Image.network(
                  path,
                  width: 250,
                  height: 250,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              path,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: rand, child: const Icon(Icons.arrow_forward)),
          ],
        ),
      ),
    );
  }
}

Future<void> dialogBuilder(BuildContext context, String path) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      Size size = MediaQuery.sizeOf(context);
      return Image.network(
        path,
        width: size.width,
        height: size.width,
      );
    },
  );
}
