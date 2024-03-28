import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}):super(key: key);

  // This widget is the root of your application.

  //to dr
  @override
  Widget build(BuildContext context) {
    //inside 'scaffold' we can chage background, body
    //inside the body we can create container
    //everithing in flutter is a wigget
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
    }
}





