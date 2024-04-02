// ignore_for_file: use_build_context_synchronously

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:test_flutter/PopUp.dart';
import '../CCTheme.dart';
import 'package:postgres/postgres.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import '../Database.dart';

Random _rnd = Random.secure();

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: _firstNameController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'First Name:',
            ),
          ),
          TextFormField(
            controller: _lastNameController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Last Name:',
            ),
          ),
          TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Username:',
            ),
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Email:',
            ),
          ),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Password:',
            ),
          ),
          TextFormField(
            controller: _confPasswordController,
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
              if (_passwordController.text == _confPasswordController.text) {
                Connection conn = Database.conn;

                // Hash password
                String salt = getRandomString(32);
                var bytes = utf8.encode(_passwordController.text + salt);
                var passwordHash = sha1.convert(bytes);

                try {
                  // Attempt to add user input to database as budgeting_user
                  if (_firstNameController.text == "" ||
                      _lastNameController.text == "" ||
                      _usernameController.text == "" ||
                      _emailController.text == "" || 
                      _passwordController.text == ""){
                    PopUp.showAlertDialog(context, "Error", "Fields cannot be blank");
                  }
                  else{
                    final result = await conn.execute(
                      r'INSERT INTO budgeting_user (id, first_name, last_name, username, email, pass, salt) VALUES ($1, $2, $3, $4, $5, $6, $7)',
                      parameters: [
                        _rnd.nextInt(2147483647),
                        _firstNameController.text,
                        _lastNameController.text,
                        _usernameController.text,
                        _emailController.text,
                        passwordHash.toString(),
                        salt
                      ],
                    );
                    // If account successfully created, go back to login page
                    if (result.affectedRows == 1) {
                      Navigator.pop(context);
                    }
                  }
                } on Exception catch (e) {
                  // Show error if username already exists
                  if (e.toString().contains('duplicate key') &&
                      e.toString().contains('(email)')) {
                    PopUp.showAlertDialog(context, 'Error',
                        'Account already exists with this email');
                  }
                  // Show error if email already exists
                  else if (e.toString().contains('duplicate key') &&
                      e.toString().contains('(username)')) {
                    PopUp.showAlertDialog(context, 'Error',
                        'Account already exists with this username');
                  } else {
                    PopUp.showAlertDialog(
                        context, 'Error', 'Unknown error occurred');
                  }
                } catch (e, s) {
                  print('\x1B[33mException details:\n $e\x1B[0m');
                }
              }
              // If passwords dont match, show error
              else {
                PopUp.showAlertDialog(
                    context, "Error", 'Passwords do not match');
              }
            },
            child: const Text('Submit'),
          ),
        ],
      )),
    );
  }
}

String getRandomString(int length) {
  const chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  return String.fromCharCodes(Iterable.generate(
      length, (_) => chars.codeUnitAt(_rnd.nextInt(chars.length))));
}

