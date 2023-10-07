import 'package:flutter/material.dart';
import 'package:note/widgets/func.dart';
import 'package:note/platform/window_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WindowBar(
        logo: Icon(Icons.note_alt),
        title: Text(
          "NOTE",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: FuncBar(),
          ),
          Container(),
        ],
      ),
    );
  }
}
