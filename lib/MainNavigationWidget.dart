import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: Image.asset('deliverables/_static/logo-green.png',
            fit: BoxFit.fitHeight),
        centerTitle: true,
      ),
      body: currentPage,
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 245, 245, 245),
        notchMargin: 5,
        shape: const CircularNotchedRectangle(),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              color: const Color.fromARGB(255, 34, 203, 67),
              onPressed: () {
                SetCurrentPage(NavigationPage.HOME);
              },
            ),
            IconButton(
              icon: const Icon(Icons.attach_money),
              color: const Color.fromARGB(255, 34, 203, 67),
              onPressed: () {
                SetCurrentPage(NavigationPage.BUDGET);
              },
            ),
            IconButton(
              icon: const Icon(Icons.wallet),
              color: const Color.fromARGB(255, 34, 203, 67),
              onPressed: () {
                SetCurrentPage(NavigationPage.GOAL);
              },
            ),
            IconButton(
              icon: const Icon(Icons.account_circle),
              color: const Color.fromARGB(255, 34, 203, 67),
              onPressed: () {
                SetCurrentPage(NavigationPage.ACCOUNT);
              },
            ),
          ],
        ),
      ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 34, 203, 67),
        foregroundColor: Colors.white,
        onPressed: () {
          print("Floating Action Button Pressed");
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),

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
