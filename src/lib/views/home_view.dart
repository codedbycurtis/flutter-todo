import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  /// Creates a [HomePage].
  const HomePage({Key? key}) : super(key: key);
  final String title = "Home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text("There's nothing to see here right now."),
      ),
    );
  }
}