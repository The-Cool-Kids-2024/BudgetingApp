import 'package:flutter/material.dart';
import '../CCTheme.dart';

Container CCHeaderContainer(String title, String desc, {Color textColor = Colors.black, Color backgroundColor = CCTheme.background, double height = 80}) {
  return Container(
    width: 400,
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
        color: backgroundColor, borderRadius: BorderRadius.circular(16),),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height),
        Text(
          '$title\n$desc',
          style: TextStyle(
              fontSize: 28,
              color: textColor,
              fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Container CCContainer(String title, String desc, {Color textColor = CCTheme.primary, Color backgroundColor = CCTheme.complement, double height = 80}) {
  return Container(
    width: 350,
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
        color: backgroundColor, borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height),
        Text(
          '$title\n$desc',
          style: TextStyle(
              fontSize: 28,
              color: textColor,
              fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Container CCSpacer() {
  return Container(
    width: 350,
    padding: const EdgeInsets.all(0),
    decoration: BoxDecoration(
        color: const Color.fromARGB(0, 0, 0, 0),
        borderRadius: BorderRadius.circular(1)),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 10),
      ],
    ),
  );
}