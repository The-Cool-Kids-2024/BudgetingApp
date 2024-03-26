import 'package:flutter/material.dart';
import 'package:test_flutter/Error.dart';
import '../CCTheme.dart';
import 'package:postgres/postgres.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import '../User.dart';
import '../Database.dart';
import '../MainNavigationWidget.dart';

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
                User.userId = int.parse(result[0][0].toString());
                User.username = result[0][1].toString();
              } else {
                ErrorPopUp.showAlertDialog(context, 'Username or password is incorrect.');
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
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
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
              }
              // If passwords dont match, show error
              else {
                ErrorPopUp.showAlertDialog(context, 'Passwords do not match');
              }
            },
            child: const Text('Submit'),
          ),
        ],
      )),
    );
  }
}
