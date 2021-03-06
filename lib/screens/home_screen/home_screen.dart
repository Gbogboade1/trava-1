import "package:flutter/material.dart";
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trava/components/hooks/profile_data_listening_widget.dart';
import 'package:trava/screens/home_screen/components/buttons/home_screen_button.dart';
import 'package:trava/screens/home_screen/components/tab_views/transactions_list_view.dart';
import 'package:trava/screens/home_screen/fund_wallet_screen/fund_wallet_screen.dart';
import 'package:trava/screens/home_screen/notifications_screen/notifications_screen.dart';
import 'package:trava/screens/home_screen/withdrawal_screen/withdrawal_screen.dart';
import 'package:trava/state/profile/auth_state.dart';
import 'package:trava/style/colors.dart';
import 'package:trava/utils/intl_formatter.dart';
import 'components/buttons/request_to_deliver_button.dart';
import 'components/buttons/send_packages_button.dart';
import 'components/tab_views/operations_list_view.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthState>();
    final tabController = useTabController(initialLength: 2);
    return ProfileSetUpDataListeningWidget(
      builder: (context, profile) => Scaffold(
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
                          onTap: () async {
                            Navigator.pushNamed(
                                context, NotificationsScreen.routeName);
                            model.updateNotifications = null;
                          },
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
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: TravaColors.white),
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
                    Text(
                      "How can we help you earn and save money today?",
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: TravaColors.white),
                    ),
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
                          controller: tabController,
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
                        Expanded(
                          child: TabBarView(
                            controller: tabController,
                            children: const [
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
