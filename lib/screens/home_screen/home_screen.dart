import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/screens/home_screen/components/buttons/home_screen_button.dart';
import 'package:trava/widgets/custom_scaffold.dart';

import 'components/buttons/request_to_deliver_button.dart';
import 'components/buttons/send_payment_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        "Hi, Hendrick",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                      const Icon(
                        Icons.notifications_active_rounded,
                        color: Colors.white,
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
                    "₦ 8,950.00",
                    style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const HomeScreenButton(
                        buttonLabel: "Withdrawal",
                      ),
                      SizedBox(width: 30.w),
                      const HomeScreenButton(
                        color: Color(0xffCFAE00),
                        buttonLabel: "Fund Wallet",
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  Text("How can we help you earn and save money today?",
                      style: Theme.of(context).textTheme.headline4),
                  SizedBox(height: 16.h),
                  const SendPaymentButton(),
                  SizedBox(height: 12.h),
                  const RequestToDeliverButton(),
                  SizedBox(height: 22.h),
                ],
              ),
            ),
            Expanded(
              child: Container(
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
                        isScrollable: true,
                        indicatorColor: Colors.black,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelStyle:
                            Theme.of(context).textTheme.headline5!.copyWith(
                                  decorationStyle: TextDecorationStyle.solid,
                                ),
                        unselectedLabelStyle: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(
                              color:
                                  Theme.of(context).colorScheme.primaryVariant,
                            ),
                        tabs: const [
                          Text("Operations"),
                          Text("Transactions"),
                        ],
                      ),
                      TabBarView(
                        children: [
                          Container(),
                          Container(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
