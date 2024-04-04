// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../CCTheme.dart';
import '../User.dart';
import '../Database.dart';
import '../PopUp.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: firstNameController,
            decoration: const InputDecoration(
              labelText: "First Name",
            ),
          ),
          TextFormField(
            controller: lastNameController,
            decoration: const InputDecoration(
              labelText: "Last Name",
            ),
          ),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: "Email",
            ),
          ),
          TextFormField(
            controller: usernameController,
            decoration: const InputDecoration(
              labelText: "Username",
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: CCTheme.primary,
              foregroundColor: Colors.white,
            ),
            onPressed: () async {
              // Attempt to add user input to database as budgeting_user
              try {
                final result = await Database.conn.execute(
                  r'UPDATE budgeting_user SET first_name = $1, last_name = $2, username = $3, email = $4 WHERE id = $5',
                  parameters: [
                    firstNameController.text,
                    lastNameController.text,
                    usernameController.text,
                    emailController.text,
                    User.id.toString()
                  ],
                );
                User.firstName = firstNameController.text;
                User.lastName = lastNameController.text;
                User.username = usernameController.text;
                // If account successfully created, go back to login page
                if (result.affectedRows == 1) {
                  PopUp.showAlertDialog(
                      context, "Success", "Account updated successfully");
                }
              } on Exception catch (e) {
                if (e.toString().contains('violates check constraint')) {
                  PopUp.showAlertDialog(
                      context, 'Error', 'All fields must have a value');
                }
              } catch (e, s) {
                print('\x1B[33mException details:\n $e\x1B[0m');
              }
            },
            child: const Text('Save Changes'),
          ),
        ],
      )),
    );
  }
}
