import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statment/Home.dart';
import 'package:statment/data/data.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => data(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Todo', home: TaskPage());
  }
}
