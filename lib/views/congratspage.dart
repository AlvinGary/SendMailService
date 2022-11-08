import 'package:flutter/material.dart';

class CongratsPage extends StatefulWidget {
  const CongratsPage({super.key});
  static const String routeName = "/congrats";

  @override
  State<CongratsPage> createState() => _CongratsPageState();
}

class _CongratsPageState extends State<CongratsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Congratulations!!!"),
      ),
      body: Center(
        child: Text("Welcome to our app, enjoy exploring!"),
      ),
    );
  }
}
