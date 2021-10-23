import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trava/widgets/custom_scaffold.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
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
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color:
                          currentIndex == 0 ? Colors.white : Colors.transparent,
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
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color:
                          currentIndex == 1 ? Colors.white : Colors.transparent,
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
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color:
                          currentIndex == 2 ? Colors.white : Colors.transparent,
                    ),
                    child: const Text("Delivered"),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          
        ],
      ),
    );
  }
}
