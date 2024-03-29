import 'package:flutter/material.dart';
import 'package:test_flutter/PopUp.dart';
import '../CCTheme.dart';
import 'package:postgres/postgres.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import '../Database.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: firstNameController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'First Name:',
            ),
          ),
          TextFormField(
            controller: lastNameController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Last Name:',
            ),
          ),
          TextFormField(
            controller: usernameController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Username:',
            ),
          ),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Email:',
            ),
          ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Password:',
            ),
          ),
          TextFormField(
            controller: confPasswordController,
            obscureText: true,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Confirm Password:',
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: CCTheme.primary,
              foregroundColor: Colors.white,
            ),
            onPressed: () async {
              // Connect to database
              if (passwordController.text == confPasswordController.text) {
                Connection conn = Database.conn;

                // Hash password
                var bytes = utf8.encode(passwordController.text);
                var passwordHash = sha1.convert(bytes);

                try {
                  // Attempt to add user input to database as budgeting_user
                  final result = await conn.execute(
                    r'INSERT INTO budgeting_user (first_name, last_name, username, email, pass) VALUES ($1, $2, $3, $4, $5)',
                    parameters: [
                      firstNameController.text,
                      lastNameController.text,
                      usernameController.text,
                      emailController.text,
                      passwordHash.toString()
                    ],
                  );

                  // If account successfully created, go back to login page
                  if (result.affectedRows == 1) {
                    Navigator.pop(context);
                  }
                } on Exception catch (e) {
                  // Show error if any field is empty
                  if (e.toString().contains('violates check constraint')) {
                    PopUp.showAlertDialog(context, 'Error', 'All fields must have a value');
                  }
                  // Show error if username already exists
                  else if (e.toString().contains('duplicate key') && e.toString().contains('(email)')) {
                    PopUp.showAlertDialog(context, 'Error', 'Account already exists with this email');
                  }
                  // Show error if email already exists
                  else if (e.toString().contains('duplicate key') && e.toString().contains('(username)')) {
                    PopUp.showAlertDialog(context, 'Error', 'Account already exists with this username');
                  }
                  else {
                    PopUp.showAlertDialog(context, 'Error', 'Unknown error occurred');
                  }
                } catch (e, s) {
                  print('\x1B[33mException details:\n $e\x1B[0m');
                }
              }
              // If passwords dont match, show error
              else {
                PopUp.showAlertDialog(context, "Error", 'Passwords do not match');
              }
            },
            child: const Text('Submit'),
          ),
        ],
      )),
    );
  }
}
