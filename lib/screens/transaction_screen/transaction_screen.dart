import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                "12-05-2021",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primaryVariant,
                ),
              ),
              SizedBox(height: 8.h),
              Expanded(
                child: ListView.builder(
                  itemCount: 27,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: Row(
                        children: [
                          const Icon(Icons.arrow_circle_down),
                          SizedBox(width: 16.w),
                          Flexible(
                            child: Text(
                              "You paid ₦1,570 to send your package (023) with to Timi Akinlaja to DHL Hub, Asaba, Delta State at 12:02pm",
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
          ),
        ),
      ),
    );
  }
}
