import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GoalsPage extends StatefulWidget {
  const GoalsPage({super.key});

  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  @override
  Widget build(BuildContext context) {
    return const Center( child: Text("Goals Page"));
  }
}
