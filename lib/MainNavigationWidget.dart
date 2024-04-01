import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:test_flutter/CCTheme.dart';
import 'package:test_flutter/Pages/AddEntry.dart';
import 'package:test_flutter/Pages/AddGoal.dart';
import 'package:test_flutter/Pages/BudgetPage.dart';

import 'Pages/AccountPage.dart';
import 'Pages/HomePage.dart';
import 'Pages/Login.dart';
import 'Pages/CreateAccountPage.dart';
import 'PopUp.dart';
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
  AccountPage accountPage = const AccountPage();

  late Widget currentPage;
  _MainNavigationWidgetState() {
    currentPage = loginPage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: currentPage,
        extendBody: true,
        appBar:
            /* Talk about this on monday.
      AppBar(
        actionsIconTheme: const IconThemeData(
            size: 30.0,
            color: Colors.black,
            opacity: 10.0
        ),
        title: const Text('CommonCents',
            style:
            TextStyle(fontSize: 45, color: Color.fromRGBO(34, 203, 67, 1))),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 0.00,
        backgroundColor: const Color.fromARGB(245, 222, 221, 227),

        leading: GestureDetector(
          onTap: () { /* Write listener code here */ },
          child:const  Icon(
              Icons.home,
              color: Color.fromRGBO(34, 203, 67, 1)  // add custom icons also
          ),
        ),

        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.perm_identity_rounded,
                  size: 26.0,
                  color: Color.fromRGBO(34, 203, 67, 1),
                ),

              )
          ),

        ],
      ),
      */
            AppBar(
          title: Image.asset('deliverables/_static/logo-green.png',
              fit: BoxFit.fitHeight),
          centerTitle: true,
          backgroundColor: CCTheme.background,
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 5,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.home),
                color: CCTheme.primary,
                onPressed: () {
                  if (User.id != 0) {
                    SetCurrentPage(NavigationPage.HOME);
                  } else {
                    PopUp.showAlertDialog(context, "Error",
                        "You must log in before accessing your budget data");
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.attach_money),
                color: CCTheme.primary,
                onPressed: () {
                  if (User.id != 0) {
                    SetCurrentPage(NavigationPage.BUDGET);
                  } else {
                    PopUp.showAlertDialog(context, "Error",
                        "You must log in before accessing your budget data");
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.wallet),
                color: CCTheme.primary,
                onPressed: () {
                  if (User.id != 0) {
                    SetCurrentPage(NavigationPage.GOAL);
                  } else {
                    PopUp.showAlertDialog(context, "Error",
                        "You must log in before accessing your budget data");
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.account_circle),
                color: CCTheme.primary,
                onPressed: () {
                  if (User.id != 0) {
                    SetCurrentPage(NavigationPage.ACCOUNT);
                  } else {
                    PopUp.showAlertDialog(context, "Error",
                        "You must log in before accessing your budget data");
                  }
                },
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SpeedDial(
          backgroundColor: CCTheme.primary,
          foregroundColor: Colors.white,
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
          direction: SpeedDialDirection.up,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.attach_money),
              label: 'Add Transaction',
              onTap: () {
                if (User.id != 0) {
                  var result = Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddEntryPage()));
                } else {
                  PopUp.showAlertDialog(context, "Error",
                      "You must log in before adding budget data");
                }
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.wallet),
              label: 'Add Goal',
              onTap: () {
                if (User.id != 0) {
                  var result = Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddGoalPage()));
                } else {
                  PopUp.showAlertDialog(context, "Error",
                      "You must log in before adding budget data");
                }
              },
            ),
          ],
        ));
  }

  void SetCurrentPage(NavigationPage page) {
    setState(() {
      switch (page) {
        case NavigationPage.HOME:
          currentPage = const HomePage();
          break;
        case NavigationPage.BUDGET:
          currentPage = const BudgetPage();
          break;
        case NavigationPage.GOAL:
          //currentPage = GoalsPage(goals: goals);
          break;
        case NavigationPage.ACCOUNT:
          currentPage = const AccountPage();
          break;
        case NavigationPage.LOGIN:
          currentPage = const LoginPage();
          break;
        case NavigationPage.CREATEACCOUNT:
          currentPage = const CreateAccountPage();
          break;
      }
    });
  }
}

enum NavigationPage {
  LOGIN,
  CREATEACCOUNT,
  HOME,
  BUDGET,
  GOAL,
  ACCOUNT
}