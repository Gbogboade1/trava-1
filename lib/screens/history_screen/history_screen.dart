import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/screens/history_screen/components/tabviews/delivered_tabview.dart';
import 'package:trava/screens/history_screen/components/tabviews/sent_tabview.dart';
import 'package:trava/screens/history_screen/components/tabviews/to_be_delivered_tabview.dart';
import 'package:trava/utils/intl_formatter.dart';

class HistoryScreen extends HookWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);
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
                "History",
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: 8.h),
              Text(
                "Keep track of all your operations on Trava",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(height: 16.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                decoration: BoxDecoration(
                  color: const Color(0xffF2F2F2).withOpacity(0.4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        currentIndex.value = 0;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 12.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: currentIndex.value == 0
                              ? Colors.white
                              : Colors.transparent,
                        ),
                        child: const Text("Sent"),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        currentIndex.value = 1;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 12.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: currentIndex.value == 1
                              ? Colors.white
                              : Colors.transparent,
                        ),
                        child: const Text("To be delivered"),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        currentIndex.value = 2;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 12.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: currentIndex.value == 2
                              ? Colors.white
                              : Colors.transparent,
                        ),
                        child: const Text("Delivered"),
                      ),
                    ),
                  ],
                ),
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
              () {
                switch (currentIndex.value) {
                  case 0:
                    return SentTabView();
                  case 1:
                    return ToBeDeliveredTabView();
                  case 2:
                    return const DeliveredTabView();
                  default:
                    return const SizedBox();
                }
              }(),
            ],
          ),
        ),
      ),
    );
  }
}
