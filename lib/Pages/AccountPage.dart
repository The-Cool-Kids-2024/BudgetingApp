import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
              labelText: 'Username',
            ),
          ),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Email:',
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 34, 203, 67),
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              print(usernameController.text);
            },
            child: const Text('Save Changes'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 34, 203, 67),
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              print('Logged out');
            },
            child: const Text('Log out'),
          ),
        ],
      )),
    );
  }
}
