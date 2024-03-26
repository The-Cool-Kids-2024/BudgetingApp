// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:test_flutter/PopUp.dart';
import '../CCTheme.dart';
import 'package:postgres/postgres.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import '../User.dart';
import '../Database.dart';
import '../MainNavigationWidget.dart';
import 'CreateAccountPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: usernameController,
            decoration: const InputDecoration(
              icon: Icon(Icons.perm_identity),
              border: UnderlineInputBorder(),
              labelText: 'Username:',
            ),
          ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              icon: Icon(Icons.lock_outline),
              border: UnderlineInputBorder(),
              labelText: 'Password:',
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: CCTheme.primary,
              foregroundColor: Colors.white,
            ),
            onPressed: () async {
              Connection conn = Database.conn;

              // Hash password
              var bytes = utf8.encode(passwordController.text);
              var passwordHash = sha1.convert(bytes);

              // Attempt to find user with credentials
              final result = await conn.execute(
                r'SELECT id, username FROM budgeting_user WHERE username = $1 AND pass = $2',
                parameters: [usernameController.text, passwordHash.toString()],
              );

              // If username and password match, log in and go to home page
              if (result.length != 0) {
                print('Log in successful');
                print('id:' + result[0][0].toString());
                User.id = int.parse(result[0][0].toString());
                User.username = result[0][1].toString();
              } else {
                PopUp.showAlertDialog(
                    context, "Error", 'Username or password is incorrect.');
              }
            },
            child: const Text('Log In'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: CCTheme.primary,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CreateAccountPage()),
              );
            },
            child: const Text('Create Account'),
          ),
        ],
      )),
    );
  }
}
