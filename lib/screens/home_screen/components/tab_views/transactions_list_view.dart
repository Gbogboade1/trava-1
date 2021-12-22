import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/src/provider.dart';
import 'package:trava/components/fragments/indicators/app_loader.dart';
import 'package:trava/components/fragments/state/app_error_state.dart';
import 'package:trava/models/https/payment/tranaction_history.dart';
import 'package:trava/state/profile/auth_state.dart';
import 'package:trava/utils/helpers.dart';
import 'package:trava/widgets/empty_list_state.dart';

enum TransactionType {
  income,
  expense,
}

class TransactionsListView extends StatelessWidget {
  const TransactionsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthState>();
    return ValueListenableBuilder<Future<TransactionHistory?>?>(
        valueListenable: model.transactions,
        builder: (context, task, ___) {
          return FutureBuilder<TransactionHistory?>(
            future: task,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting &&
                  snapshot.data == null) return const Apploader();
              if (snapshot.hasError && snapshot.data == null) {
                return TravaErrorState(
                  errorMessage: parseError(
                    snapshot.error,
                    "We could not fetch sent history",
                  ),
                  onRetry: () {},
                );
              }
              return snapshot.data!.data!.isNotEmpty
                  ? Column(
                      children: [
                        SizedBox(height: 24.0.h),
                        Expanded(
                          child: ListView.builder(
                            itemCount: snapshot.data?.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              TransactionType type =
                                  (snapshot.data?.data?[index].type ?? '') ==
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
                                              color: const Color(0xff171718),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  : const EmptyListState();
            },
          );
        });
  }
}
