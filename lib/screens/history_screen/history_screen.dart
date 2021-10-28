import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/screens/history_screen/components/tabviews/delivered_tabview.dart';
import 'package:trava/screens/history_screen/components/tabviews/sent_tabview.dart';
import 'package:trava/screens/history_screen/components/tabviews/to_be_delivered_tabview.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int currentIndex = 0;
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
                        setState(() {
                          if (mounted) {
                            currentIndex = 0;
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 12.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: currentIndex == 0
                              ? Colors.white
                              : Colors.transparent,
                        ),
                        child: const Text("Sent"),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (mounted) {
                            currentIndex = 1;
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 12.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: currentIndex == 1
                              ? Colors.white
                              : Colors.transparent,
                        ),
                        child: const Text("To be delivered"),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (mounted) {
                            currentIndex = 2;
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 12.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: currentIndex == 2
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
                "12-05-2021",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primaryVariant,
                ),
              ),
              SizedBox(height: 8.h),
              () {
                switch (currentIndex) {
                  case 0:
                    return const SentTabView();
                  case 1:
                    return const ToBeDeliveredTabView();
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
