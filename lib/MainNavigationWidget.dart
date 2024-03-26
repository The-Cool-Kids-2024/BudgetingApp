import 'package:flutter/material.dart';
import 'package:test_flutter/PopUp.dart';
import 'package:test_flutter/Pages/GoalsPage.dart';
import 'package:test_flutter/Pages/Login.dart';

import 'Pages/AccountPage.dart';
import 'Pages/BudgetPage.dart';
import 'Pages/HomePage.dart';
import 'Pages/CreateAccountPage.dart';
import 'CCTheme.dart';
import 'User.dart';

class MainNavigationWidget extends StatefulWidget {
  const MainNavigationWidget({super.key});

  @override
  State<MainNavigationWidget> createState() => _MainNavigationWidgetState();
}

class _MainNavigationWidgetState extends State<MainNavigationWidget> {
  // So that states are maintained, make an object for each page.
  LoginPage loginPage = const LoginPage();
  CreateAccountPage createAccountPage = const CreateAccountPage();
  HomePage homePage = const HomePage();
  BudgetPage budgetPage = const BudgetPage();
  GoalsPage goalsPage = const GoalsPage();
  AccountPage accountPage = const AccountPage();

  late Widget currentPage;
  _MainNavigationWidgetState() {
    currentPage = loginPage;
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
          color: CCTheme.background,
          notchMargin: 5,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.home),
                color: CCTheme.primary,
                onPressed: () {
                  if (User.id != 0){
                    SetCurrentPage(NavigationPage.HOME);
                  }
                  else {
                    PopUp.showAlertDialog(context, "Error", "You must log in before accessing your budget data");
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.attach_money),
                color: CCTheme.primary,
                onPressed: () {
                  if (User.id != 0){
                    SetCurrentPage(NavigationPage.BUDGET);
                  }
                  else {
                    PopUp.showAlertDialog(context, "Error", "You must log in before accessing your budget data");
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.wallet),
                color: CCTheme.primary,
                onPressed: () {
                  if (User.id != 0){
                    SetCurrentPage(NavigationPage.GOAL);
                  }
                  else {
                    PopUp.showAlertDialog(context, "Error", "You must log in before accessing your budget data");
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.account_circle),
                color: CCTheme.primary,
                onPressed: () {
                  if (User.id != 0){
                    SetCurrentPage(NavigationPage.ACCOUNT);
                  }
                  else {
                    PopUp.showAlertDialog(context, "Error", "You must log in before accessing your budget data");
                  }
                },
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: CCTheme.primary,
          foregroundColor: Colors.white,
          onPressed: () {
            if (User.id != 0) {
              print('Floating button pressed');
            }
            else {
              PopUp.showAlertDialog(context, "Error", "You must log in before accessing your budget data");
            }
          },
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ));
  }

  void SetCurrentPage(NavigationPage page) {
    setState(() {
      switch (page) {
        case NavigationPage.LOGIN:
          currentPage = const LoginPage();
          break;
        case NavigationPage.CREATEACCOUNT:
          currentPage = const CreateAccountPage();
          break;
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

enum NavigationPage { LOGIN, CREATEACCOUNT, HOME, BUDGET, GOAL, ACCOUNT }
