import 'dart:convert';

import 'package:class_week6/views/sendmail.dart';
import 'package:flutter/material.dart';
import 'package:class_week6/services/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SendMailPage(),
    );
  }
}
