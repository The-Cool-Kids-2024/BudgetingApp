import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:test_flutter/CCTheme.dart';
import 'package:test_flutter/Pages/GoalsPage.dart';

import 'Pages/AccountPage.dart';
import 'Pages/BudgetPage.dart';
import 'Pages/HomePage.dart';

class MainNavigationWidget extends StatefulWidget {
  const MainNavigationWidget({super.key});

  @override
  State<MainNavigationWidget> createState() => _MainNavigationWidgetState();
}

class _MainNavigationWidgetState extends State<MainNavigationWidget> {

  // So that states are maintained, make an object for each page.
  HomePage homePage = const HomePage();
  BudgetPage budgetPage = const BudgetPage();
  GoalsPage goalsPage = const GoalsPage();
  AccountPage accountPage = const AccountPage();

  late Widget currentPage;
  _MainNavigationWidgetState() {
    currentPage = homePage;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage,
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        shape: const CircularNotchedRectangle(),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              color: CCTheme.text,
              onPressed: () {
                SetCurrentPage(NavigationPage.HOME);
              },
            ),
            IconButton(
              icon: const Icon(Icons.attach_money),
              color: CCTheme.text,
              onPressed: () {
                SetCurrentPage(NavigationPage.BUDGET);
              },
            ),
            IconButton(
              icon: const Icon(Icons.wallet),
              color: CCTheme.text,
              onPressed: () {
                SetCurrentPage(NavigationPage.GOAL);
              },
            ),
            IconButton(
              icon: const Icon(Icons.account_circle),
              color: CCTheme.text,
              onPressed: () {
                SetCurrentPage(NavigationPage.ACCOUNT);
              },
            ),
          ],
        ),
      ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SpeedDial(
        backgroundColor: CCTheme.accent,
        foregroundColor: CCTheme.text,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
        direction: SpeedDialDirection.up,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.attach_money),
            label: 'Add Transaction',
            onTap: () {
              print('Add Transaction');
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.wallet),
            label: 'Add Goal',
            onTap: () {
              print('Add Goal');
            },
          ),
        ],

      )
    );
  }

  void SetCurrentPage(NavigationPage page) {
    setState(() {
      switch(page) {
        case NavigationPage.HOME:
          currentPage = const HomePage();
          break;
case NavigationPage.BUDGET:
          currentPage = const BudgetPage();
          break;
case NavigationPage.GOAL:
          currentPage = const GoalsPage();
          break;
case NavigationPage.ACCOUNT:
          currentPage = const AccountPage();
          break;
      }
    });
  }
}

enum NavigationPage {
  HOME,
  BUDGET,
  GOAL,
  ACCOUNT

}
