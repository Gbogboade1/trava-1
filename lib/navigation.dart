
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:trava/screens/history_screen/history_screen.dart';
import 'package:trava/screens/home_screen/home_screen.dart';
import 'package:trava/screens/more_screen/more_screen.dart';
import 'package:trava/screens/transaction_screen/transaction_screen.dart';
import 'package:trava/state/profile/auth_state.dart';

class Navigation extends StatefulWidget {
  static const String routeName = "/navigation";
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  List<Widget> screens = const [
    HomeScreen(),
    HistoryScreen(),
    TransactionScreen(),
    MoreScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthState>();
    return ValueListenableBuilder<int>(
      valueListenable: model.currentIndex,
      builder: (context, int index, ___) => Scaffold(
        body: screens[index],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          onTap: (i) {
            // log('waitn dea happen');
            model.current = i;
            // log('waitn dea happen ${model.currentIndex.value}');
          },
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/history.svg",
                ),
                activeIcon: SvgPicture.asset(
                  "assets/images/history.svg",
                  color: Theme.of(context).colorScheme.primary,
                ),
                label: "History"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/transactions.svg"),
                activeIcon: SvgPicture.asset(
                  "assets/images/transactions.svg",
                  color: Theme.of(context).colorScheme.primary,
                ),
                label: "Transactions"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/more.svg"),
                activeIcon: SvgPicture.asset(
                  "assets/images/more.svg",
                  color: Theme.of(context).colorScheme.primary,
                ),
                label: "More"),
          ],
        ),
      ),
    );
  }
}
