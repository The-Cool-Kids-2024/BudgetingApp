import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),

      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TextField(
                enabled: false,
                decoration: InputDecoration(
                  labelText: "Ethan",
                ),
              ),
              const TextField(
                enabled: false,
                decoration: InputDecoration(
                  labelText: "Timpe",
                ),
              ),
              const TextField(
                enabled: false,
                decoration: InputDecoration(
                  labelText: "ethantimpe",
                ),
              ),
              const TextField(
                enabled: false,
                decoration: InputDecoration(
                  labelText: "timpe.4@wright.edu",
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 34, 203, 67),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  print('Press');
                },
                child: const Text('Edit'),
              ),
            ],
          )
      ),
    );
  }
}
