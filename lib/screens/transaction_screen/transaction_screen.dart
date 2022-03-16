import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trava/components/fragments/indicators/app_loader.dart';
import 'package:trava/components/fragments/state/app_error_state.dart';
import 'package:trava/models/https/payment/tranaction_history.dart';
import 'package:trava/state/profile/auth_state.dart';
import 'package:provider/provider.dart';
import 'package:trava/utils/helpers.dart';
import 'package:trava/utils/intl_formatter.dart';
import 'package:trava/widgets/empty_list_state.dart';

enum TransactionType {
  income,
  expense,
}

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthState>();
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 27.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Transactions",
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: 8.h),
              Text(
                "Here is a record of all your transactions on Trava",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(height: 16.h),
              Text(
                TravaFormatter.formatDate('${DateTime.now()}'),
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primaryVariant,
                ),
              ),
              SizedBox(height: 8.h),
              Expanded(
                child: ValueListenableBuilder<Future<TransactionHistory?>?>(
                  valueListenable: model.transactions,
                  builder: (context, task, ___) {
                    return FutureBuilder<TransactionHistory?>(
                      future: task,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                                ConnectionState.waiting &&
                            snapshot.data == null) return const Apploader();
                        if (snapshot.hasError && snapshot.data == null) {
                          return TravaErrorState(
                            errorMessage: parseError(
                              snapshot.error,
                              "We could not fetch sent history",
                            ),
                            onRetry: () => model.transactions =
                                ValueNotifier(model.getTransactions()),
                          );
                        }
                        return snapshot.data!.data!.isNotEmpty
                            ? ListView.builder(
                                itemCount: snapshot.data?.data?.length ?? 0,
                                itemBuilder: (context, index) {
                                  TransactionType type =
                                      (snapshot.data?.data?[index].type ??
                                                  '') ==
                                              'deposit'
                                          ? TransactionType.income
                                          : TransactionType.expense;
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 12.h),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(() {
                                          switch (type) {
                                            case TransactionType.income:
                                              return "assets/images/fund.svg";
                                            case TransactionType.expense:
                                              return "assets/images/withdrawal.svg";
                                          }
                                        }()),
                                        SizedBox(width: 16.w),
                                        Flexible(
                                          child: Text(
                                            // () {
                                            //   switch (type) {
                                            //     case TransactionType.income:
                                            //       return "You funded your Trava wallet ₦1,570 at 12:02pm";
                                            //     case TransactionType.expense:
                                            //       return "You paid ₦1,570 to send your package (023) with to Timi Akinlaja to DHL Hub, Asaba, Delta State at 12:02pm";
                                            //   }
                                            // }(),
                                            (snapshot.data?.data?[index]
                                                    .description ??
                                                ''),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4!
                                                .copyWith(
                                                  color:
                                                      const Color(0xff171718),
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )
                            : const Center(child: EmptyListState());
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
