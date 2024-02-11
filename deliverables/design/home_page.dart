// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 208, 211, 167),
      body: SafeArea(
     
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                 
                    children: const [
                      
                      Text(
                        'CommonCents',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                     
                    ],
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 160, 175, 161),
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(children: const [
                        Icon(Icons.login),
                        Text('Login')
                      ],)
                      
                      ),
                      
                ],
              ),
            ),

            SizedBox(height: 25),
            //summery
            //my manu

            Container(
              width: 300,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.green[600],
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(height: 100),
                  Text('Income/Expense',
                  style: TextStyle(fontSize: 28,
                  color: Colors.white),),
                ],
              ),
            ),
            Container(
              width: 300,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.green[600],
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 100),
                  
                  Text('Budget',
                  style: TextStyle(fontSize: 28,
                  color: Colors.white),),
                ],
              ),
            ),
            Container(
              width: 300,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.green[600],
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 100),
                  Text('Goal',
                  style: TextStyle(fontSize: 28,
                  color: Colors.white),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
