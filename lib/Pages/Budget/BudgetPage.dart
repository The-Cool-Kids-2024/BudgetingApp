import 'package:flutter/material.dart';
import 'package:test_flutter/Pages/Budget/MonthlyBudgetPage.dart';
import 'package:test_flutter/Pages/Budget/YearlyBudgetPage.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        width: 300,
        color: Colors.green[20],
        padding: const EdgeInsets.only(left: 25, top: 25),
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Navigate to the monthly budget page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MonthlyBudgetPage()),
                );
              },
              // Button style: Background color, Shape, Padding
              style: ButtonStyle(
                // Background color: Green
                backgroundColor: MaterialStateProperty.all(Colors.green),
                // Shape: Rounded Rectangle
                shape: MaterialStateProperty.all(
                  // BorderRadius: 10
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                // Padding: 10
                padding: MaterialStateProperty.all(
                  const EdgeInsets.all(10),
                ),
              ),
              // Monthly Budget Button: This is the button to navigate to the monthly budget page
              child: const Text(
                'Monthly Budget',
                // Text style: Font size, Font weight, Text color for the button
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            // SizedBox: Height 20
            const SizedBox(height: 20),

            // Yearly Budget Button: This is the button to navigate to the yearly budget page
            ElevatedButton(
              // On pressed: Navigate to the yearly budget page
              onPressed: () {
                // Navigate to the yearly budget page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => YearlyBudgetPage()),
                );
              },
              // Button
              style: ButtonStyle(
                // Background color: Green
                backgroundColor: MaterialStateProperty.all(Colors.green),
                // Shape: Rounded Rectangle
                shape: MaterialStateProperty.all(
                  // BorderRadius: 10
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                // Padding: 10
                padding: MaterialStateProperty.all(
                  const EdgeInsets.all(10),
                ),
              ),
              child: const Text(
                'Yearly Budget',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
