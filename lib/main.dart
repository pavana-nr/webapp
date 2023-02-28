import 'package:flutter/material.dart';

import 'views/content.dart';
import 'views/menu.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) => const MaterialApp(home: HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(context) => Scaffold(
      appBar: AppBar(
          title: MediaQuery.of(context).size.width < 500
              ? const Text("Pavana's App")
              : const Text("Pavana's Web App")),
      drawer: MediaQuery.of(context).size.width < 500
          ? Drawer(
              child: Menu(),
            )
          : null,
      body: SafeArea(
          child: Center(
              child: MediaQuery.of(context).size.width < 500
                  ? Content()
                  : Row(children: [
                      SizedBox(width: 200.0, child: Menu()),
                      SizedBox(
                          width: MediaQuery.of(context).size.width - 200.0,
                          child: Content())
                    ]))));
}
