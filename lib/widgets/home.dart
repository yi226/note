import 'package:flutter/material.dart';
import 'package:note/widgets/window.dart';

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
        logo: FlutterLogo(),
        title: Text(
          "NOTE",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Scaffold(body: Container()),
    );
  }
}
