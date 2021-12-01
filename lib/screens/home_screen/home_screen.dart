import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/components/hooks/profile_data_listening_widget.dart';
import 'package:trava/screens/home_screen/components/buttons/home_screen_button.dart';
import 'package:trava/screens/home_screen/components/tab_views/transactions_list_view.dart';
import 'package:trava/screens/home_screen/fund_wallet_screen/fund_wallet_screen.dart';
import 'package:trava/screens/home_screen/notifications_screen/notifications_screen.dart';
import 'package:trava/screens/home_screen/withdrawal_screen/withdrawal_screen.dart';
import 'package:trava/utils/intl_formatter.dart';
import 'components/buttons/request_to_deliver_button.dart';
import 'components/buttons/send_packages_button.dart';
import 'components/tab_views/operations_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProfileSetUpDataListeningWidget(
      builder: (context, profile) => Scaffold(
        bottomSheet: Container(
          height: 25.h,
          color: Colors.white,
          child: Center(
            child: Text(
              "See all",
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    decoration: TextDecoration.underline,
                    color: const Color(0xff171718),
                  ),
            ),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(24.w, 21.h, 24.w, 0),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hi, ${profile?.user?.lastName ?? 'User'}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                        ),
                        InkWell(
                          onTap: () => Navigator.pushNamed(
                              context, NotificationsScreen.routeName),
                          child: const Icon(
                            Icons.notifications_active_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 22.h),
                    Text(
                      "Trava Wallet Balance",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      TravaFormatter.formatCurrency(
                        profile?.user?.wallet?.toString() ?? '0',
                      ),
                      style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HomeScreenButton(
                          onTap: () => Navigator.of(context)
                              .pushNamed(WithdrawalScreen.routeName),
                          buttonLabel: "Withdrawal",
                        ),
                        SizedBox(width: 30.w),
                        HomeScreenButton(
                          onTap: () => Navigator.of(context)
                              .pushNamed(FundWalletScreen.routeName),
                          color: const Color(0xffCFAE00),
                          buttonLabel: "Fund Wallet",
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    Text("How can we help you earn and save money today?",
                        style: Theme.of(context).textTheme.headline4),
                    SizedBox(height: 16.h),
                    const SendPackagesButton(),
                    SizedBox(height: 12.h),
                    const RequestToDeliverButton(),
                    SizedBox(height: 22.h),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40.0),
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(24.w, 17.5.h, 24.w, 0.0),
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        TabBar(
                          // isScrollable: true,
                          indicatorColor: Colors.black,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelColor: const Color(0xff171718),
                          labelStyle:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    decorationStyle: TextDecorationStyle.solid,
                                  ),
                          unselectedLabelStyle:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryVariant,
                                  ),
                          tabs: const [
                            Text("Operations"),
                            Text("Transactions"),
                          ],
                        ),
                        SizedBox(height: 24.0.h),
                        const Expanded(
                          child: TabBarView(
                            children: [
                              OperationsListView(),
                              TransactionsListView(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
