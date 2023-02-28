import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(context) => ListView(children: [
        ElevatedButton(
            onPressed: () {},
            child: const ListTile(
              leading: Icon(Icons.looks_one),
              title: Text("Settings"),
            )),
        ElevatedButton(
            onPressed: () {},
            child: const ListTile(
              leading: Icon(Icons.looks_two),
              title: Text("Profile"),
            ))
      ]);
}
