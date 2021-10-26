import 'package:flutter/material.dart';
import 'package:trava/screens/history_screen/history_screen.dart';
import 'package:trava/screens/home_screen/home_screen.dart';
import 'package:trava/screens/more_screen/more_screen.dart';
import 'package:trava/screens/transaction_screen/transaction_screen.dart';

class Navigation extends StatefulWidget {
  static const String routeName = "/navigation";
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentIndex = 0;
  List<Widget> screens = const [
    HomeScreen(),
    HistoryScreen(),
    TransactionScreen(),
    MoreScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.article), label: "History"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance), label: "Transactions"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_input_component_rounded),
                  label: "More"),
            ]));
  }
}
