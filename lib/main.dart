import 'package:flutter/material.dart';
import 'package:test_flutter/MainNavigationWidget.dart';
import 'Database.dart';

void main() {
  Database.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        //home: HomePage(),
        home: MainNavigationWidget());
  }
}
