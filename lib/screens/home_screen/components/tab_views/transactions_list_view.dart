import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return ListView.builder(
      itemCount: 7,
      itemBuilder: (context, index) {
        TransactionType type =
            index % 2 == 0 ? TransactionType.income : TransactionType.expense;
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
                  () {
                    switch (type) {
                      case TransactionType.income:
                        return "You funded your Trava wallet ₦1,570 at 12:02pm";
                      case TransactionType.expense:
                        return "You paid ₦1,570 to send your package (023) with to Timi Akinlaja to DHL Hub, Asaba, Delta State at 12:02pm";
                    }
                  }(),
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: const Color(0xff171718),
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
